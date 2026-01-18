class Bore < Formula
  desc "Blazing fast, free TCP tunnel that exposes your localhost to the world"
  homepage "https://trybore.com/"
  url "https://github.com/Aditya-ds-1806/bore/releases/download/v0.1.4/bore-0.1.4.tar.gz"
  sha256 "d544d9f2ae332bfcd25ee8be505894a23bd00af13b3dc3ab165a6f2c87911e8a"
  license "MIT"

  depends_on "go" => :build
  depends_on "make" => :build

  def install
    system "make", "build-client", "VERSION=v#{version}"
    bin.install "build/bore"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bore --version")
  end
end
