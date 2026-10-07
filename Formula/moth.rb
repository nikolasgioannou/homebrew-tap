class Moth < Formula
  desc "Opinionated issue tracker that lives in your repo, as markdown files"
  homepage "https://github.com/nikolasgioannou/moth"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nikolasgioannou/moth/releases/download/v#{version}/moth-darwin-arm64"
      sha256 "a9612b1badc01686c77f3fc2b9923ff7c733c15d827244e0f4015bf5dfb8628b"
    end
    on_intel do
      url "https://github.com/nikolasgioannou/moth/releases/download/v#{version}/moth-darwin-x64"
      sha256 "dd3f0e2175064216ff3b9511867cbf073a51f7a1bf2ba4ce93c2156434ded3fd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nikolasgioannou/moth/releases/download/v#{version}/moth-linux-arm64"
      sha256 "26d81ac4b04733a2dda63b58c2809ce03617dffcb738e0c24f479cdd3be3a140"
    end
    on_intel do
      url "https://github.com/nikolasgioannou/moth/releases/download/v#{version}/moth-linux-x64"
      sha256 "41452dfb3681a7b54701b2e185db64ad3c985af9cf34e504bb044ad2b74beda5"
    end
  end

  def install
    bin.install Dir["moth-*"].first => "moth"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/moth --version")
  end
end

