#!/usr/bin/env bash
# bump a formula's version and per-platform sha256s from a github release.
#
# usage:
#   scripts/bump-formula.sh <formula> <tag>
#
# example:
#   scripts/bump-formula.sh baton v0.4.0
#
# assumes the release has assets named:
#   <formula>-darwin-arm64, <formula>-darwin-x64,
#   <formula>-linux-arm64,  <formula>-linux-x64

set -euo pipefail

FORMULA="${1:?formula name required}"
TAG="${2:?tag required, e.g. v0.4.0}"
VERSION="${TAG#v}"

FORMULA_FILE="Formula/${FORMULA}.rb"
[ -f "$FORMULA_FILE" ] || { echo "missing $FORMULA_FILE" >&2; exit 1; }

# repo owner is fixed for this tap. override with REPO=... if needed.
REPO="${REPO:-nikolasgioannou/${FORMULA}}"

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

declare -A SHA
for platform in darwin-arm64 darwin-x64 linux-arm64 linux-x64; do
  asset="${FORMULA}-${platform}"
  url="https://github.com/${REPO}/releases/download/${TAG}/${asset}"
  echo "fetching $url"
  curl -fsSL -o "$tmp/$asset" "$url" || { echo "download failed: $url" >&2; exit 1; }
  SHA[$platform]="$(shasum -a 256 "$tmp/$asset" | awk '{print $1}')"
done

# rewrite version and the four sha256 lines. python keeps this portable across
# bsd/gnu sed and lets us match the exact platform near each sha256.
python3 - "$FORMULA_FILE" "$VERSION" \
  "${SHA[darwin-arm64]}" "${SHA[darwin-x64]}" \
  "${SHA[linux-arm64]}"  "${SHA[linux-x64]}" <<'PY'
import re, sys, pathlib

path, version, sha_darwin_arm64, sha_darwin_x64, sha_linux_arm64, sha_linux_x64 = sys.argv[1:]
src = pathlib.Path(path).read_text()

src = re.sub(r'^(\s*version\s+")[^"]+(")', rf'\g<1>{version}\g<2>', src, count=1, flags=re.M)

def replace_block(text, asset, new_sha):
    # find the url line for this asset, then replace the sha256 immediately after it
    pattern = re.compile(
        r'(url\s+"https://github\.com/[^"]+/' + re.escape(asset) + r'"\s*\n\s*sha256\s+")[0-9a-f]{64}(")'
    )
    new, n = pattern.subn(rf'\g<1>{new_sha}\g<2>', text, count=1)
    if n != 1:
        raise SystemExit(f"could not find sha256 for {asset}")
    return new

src = replace_block(src, "baton-darwin-arm64", sha_darwin_arm64)
src = replace_block(src, "baton-darwin-x64",   sha_darwin_x64)
src = replace_block(src, "baton-linux-arm64",  sha_linux_arm64)
src = replace_block(src, "baton-linux-x64",    sha_linux_x64)

pathlib.Path(path).write_text(src)
PY

echo
echo "updated $FORMULA_FILE to $VERSION:"
grep -E 'version "|sha256 "' "$FORMULA_FILE"
