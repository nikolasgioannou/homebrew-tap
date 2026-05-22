class Baton < Formula
  desc "Share Claude Code conversations with others"
  homepage "https://github.com/nikolasgioannou/baton"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nikolasgioannou/baton/releases/download/v#{version}/baton-darwin-arm64"
      sha256 "ea78d39885cc6d7907aa146cabe28bd969bb1035b7b815b2c98e23c26d788f35"
    end
    on_intel do
      url "https://github.com/nikolasgioannou/baton/releases/download/v#{version}/baton-darwin-x64"
      sha256 "48fdf45d1e1bf5465145e41bd4a0a9d560cd5cc760a6091ddc51279b28de0166"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nikolasgioannou/baton/releases/download/v#{version}/baton-linux-arm64"
      sha256 "9e52ef2a53fa4db688084a34da1bf38066216c34d5a2e74eefd9e11d4401720c"
    end
    on_intel do
      url "https://github.com/nikolasgioannou/baton/releases/download/v#{version}/baton-linux-x64"
      sha256 "980876e6d8b1723402871c428a8d6b009b506b5d6cd1480b0befca5fe1b28ff0"
    end
  end

  def install
    bin.install Dir["baton-*"].first => "baton"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/baton --version")
  end
end
