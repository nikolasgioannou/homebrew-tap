class Moth < Formula
  desc "Opinionated issue tracker that lives in your repo, as markdown files"
  homepage "https://github.com/nikolasgioannou/moth"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nikolasgioannou/moth/releases/download/v#{version}/moth-darwin-arm64"
      sha256 "6647b4ec7d66ac586aaacce3318d394f5009d9e42b6031a6dd77ee8fde3a4c74"
    end
    on_intel do
      url "https://github.com/nikolasgioannou/moth/releases/download/v#{version}/moth-darwin-x64"
      sha256 "9443611d804220a7907f9055cc5b16f1dd825cc55f9ed6a6d45c34fe1668a004"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nikolasgioannou/moth/releases/download/v#{version}/moth-linux-arm64"
      sha256 "656f5f3bf41b5e03555c0b2f905da9d0a6597ebd40f72426cc008f088b17a126"
    end
    on_intel do
      url "https://github.com/nikolasgioannou/moth/releases/download/v#{version}/moth-linux-x64"
      sha256 "cf3f8dff907d04dabbad516572334fa5866da79ee04d7e26c7208459cd5a98df"
    end
  end

  def install
    bin.install Dir["moth-*"].first => "moth"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/moth --version")
  end
end

