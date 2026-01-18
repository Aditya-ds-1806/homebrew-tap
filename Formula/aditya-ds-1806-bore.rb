class AdityaDs1806Bore < Formula
  desc "Blazing fast, free TCP tunnel that exposes your localhost to the world"
  homepage "https://trybore.com/"
  url "https://github.com/Aditya-ds-1806/bore/releases/download/v0.1.2/bore-0.1.2.tar.gz"
  sha256 "283d872f391f47073b3b7040d7e698572911d2b1c19ed44a3b18b0fc8582cddd"
  license "MIT"

  depends_on "go" => :build
  depends_on "make" => :build

  def install
    system "make", "build-client"
    bin.install "build/bore"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bore --version")
  end
end
