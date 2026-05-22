class Baton < Formula
  desc "Share Claude Code conversations with others"
  homepage "https://github.com/nikolasgioannou/baton"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nikolasgioannou/baton/releases/download/v#{version}/baton-darwin-arm64"
      sha256 "159e151d92173dc771bb44c52db711d9e77527a35db0dc22fa485890a1ecd189"
    end
    on_intel do
      url "https://github.com/nikolasgioannou/baton/releases/download/v#{version}/baton-darwin-x64"
      sha256 "851eb638752325f05d9f2481471f706c0089e7082d2969e9f9f3fdbcf4ede9ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nikolasgioannou/baton/releases/download/v#{version}/baton-linux-arm64"
      sha256 "5ba355ca420673949817541ca33b5fd0f8b38fb7bae370d2a5c1d486814aaea6"
    end
    on_intel do
      url "https://github.com/nikolasgioannou/baton/releases/download/v#{version}/baton-linux-x64"
      sha256 "e8cdd394c849115a0d5f8c42f685ba9d02878dfcfd79b6dd3c9a93c11a953182"
    end
  end

  def install
    bin.install Dir["baton-*"].first => "baton"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/baton --version")
  end
end
