class FreeForMacos < Formula
  desc "Command-line memory status tool for macOS, similar to free on Linux"
  homepage "https://github.com/zfdang/free-for-macOS"
  url "https://github.com/zfdang/free-for-macOS/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "61d5727a6a999acfaa391384cfc0418531d1388e4ccda6db82ba5c4f8958c637"
  license "MIT"

  depends_on "cmake" => :build

  depends_on :macos

  def install
    cflags = %q(-O2 -Wall -std=c99 -D_FREE_VERSION="\"${VER}\"")

    system "make", "CFLAGS=#{cflags}"
    system "gzip -c free.1 > free.1.gz"

    bin.install "free"
    man1.install "free.1.gz"
  end

  test do
    system "#{bin}/free", "-v"
  end
end
