class Bore < Formula
  desc "Blazing fast, free TCP tunnel that exposes your localhost to the world"
  homepage "https://trybore.com/"
  url "https://github.com/Aditya-ds-1806/bore/releases/download/v0.1.3/bore-0.1.3.tar.gz"
  sha256 "a9c2c37447424d91b4729ee3d909fe8fbc385f82952ef81cc2194ea4e190af24"
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
