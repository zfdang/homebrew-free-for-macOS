class FreeForMacos < Formula
  desc "Command-line memory status tool for macOS, similar to free on Linux"
  homepage "https://github.com/zfdang/free-for-macOS"
  url "https://github.com/zfdang/free-for-macOS/archive/refs/tags/1.2.0.tar.gz"
  sha256 "1a6395d9e2ec59d755c44f017748ebf8cce4d6793cd58ef0c78dbc6ea21bd714"
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
