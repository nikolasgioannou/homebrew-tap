class Moth < Formula
  desc "Opinionated issue tracker that lives in your repo, as markdown files"
  homepage "https://github.com/nikolasgioannou/moth"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nikolasgioannou/moth/releases/download/v#{version}/moth-darwin-arm64"
      sha256 "4ff26ab3766138169751f95d23e108d0c1b5da6bc861007301c7c52e043ad514"
    end
    on_intel do
      url "https://github.com/nikolasgioannou/moth/releases/download/v#{version}/moth-darwin-x64"
      sha256 "e7d8895a053644e1dc533131488103f926dfadba73a8389c7437c62cee472b9b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nikolasgioannou/moth/releases/download/v#{version}/moth-linux-arm64"
      sha256 "b67b3b9ed0e3e232616d25d117243413eec0bbb242467e94b66ccd41204f17db"
    end
    on_intel do
      url "https://github.com/nikolasgioannou/moth/releases/download/v#{version}/moth-linux-x64"
      sha256 "13248db8455b62d5f65cea8fb60f229c92c9cfb05e7f4bed1ca07acfc9f6ac99"
    end
  end

  def install
    bin.install Dir["moth-*"].first => "moth"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/moth --version")
  end
end

