class Moth < Formula
  desc "Opinionated issue tracker that lives in your repo, as markdown files"
  homepage "https://github.com/nikolasgioannou/moth"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nikolasgioannou/moth/releases/download/v#{version}/moth-darwin-arm64"
      sha256 "5d33bc83085b2f07565caf830647efc565430fda5adae9de229d20339e51b4dd"
    end
    on_intel do
      url "https://github.com/nikolasgioannou/moth/releases/download/v#{version}/moth-darwin-x64"
      sha256 "2c7fcc18680d168a4ab007387e5084b23347f2c0dc82bf9c76c7290ca29496d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nikolasgioannou/moth/releases/download/v#{version}/moth-linux-arm64"
      sha256 "1fb29e05f9a34f7b056af8814915860e1ac5a976256a860f9117163bcb3c9cf7"
    end
    on_intel do
      url "https://github.com/nikolasgioannou/moth/releases/download/v#{version}/moth-linux-x64"
      sha256 "ff2a8516c054b0888fe0995d109bd9d09d22508c3507ccfe35f8f2a0c0de7821"
    end
  end

  def install
    bin.install Dir["moth-*"].first => "moth"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/moth --version")
  end
end

