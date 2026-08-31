class Moth < Formula
  desc "Opinionated issue tracker that lives in your repo, as markdown files"
  homepage "https://github.com/nikolasgioannou/moth"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nikolasgioannou/moth/releases/download/v#{version}/moth-darwin-arm64"
      sha256 "73c750740e89adcff9318b273388c8de10d0176795f5efa565483205309a99c0"
    end
    on_intel do
      url "https://github.com/nikolasgioannou/moth/releases/download/v#{version}/moth-darwin-x64"
      sha256 "c66c583b82da775f6a87a414d418b31038fbadb0a62320baee6af9b1d35b8f91"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nikolasgioannou/moth/releases/download/v#{version}/moth-linux-arm64"
      sha256 "52e1c7fe7c51c2defeaab3eb0ab1e1b36d926caf54efa567fa4c8b70de089d43"
    end
    on_intel do
      url "https://github.com/nikolasgioannou/moth/releases/download/v#{version}/moth-linux-x64"
      sha256 "821a0303d44214a8c5cea1a21347bd2dcbf6de88b2e6d397daefd58569a3f1ec"
    end
  end

  def install
    bin.install Dir["moth-*"].first => "moth"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/moth --version")
  end
end

