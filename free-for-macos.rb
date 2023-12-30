class FreeForMacos < Formula
  desc "Command-line memory status tool for macOS, similar to free(1) on Linux"
  homepage "https://github.com/zfdang/free-for-macOS"
  url "https://github.com/zfdang/free-for-macOS/archive/refs/tags/v0.1.tar.gz"
  sha256 "1ec714121c373b013734fe0b3ebdea29ab25f7d493b7b9c857c89b424d2ac9a5"

  def install
    cflags = %q(-O2 -Wall -std=c99 -D_FREE_VERSION="\"${VER}\"")

    system "make", "CFLAGS=#{cflags}"
    system "gzip -c free.1 > free.1.gz"

    bin.install "free"
    man1.install "free.1.gz"
  end

  test do
    system "free", "-V"
  end
end
