class FreeForMacos < Formula
  desc "Command-line memory status tool for MacOS X, similar to free(1) on Linux"
  homepage "https://github.com/zfdang/free-for-macOS"
  url "https://github.com/zfdang/free-for-macOS/archive/refs/tags/1.2.0.zip"
  sha256 "29d65753f215947cc64fd3cf3f57479833543a2c501e1d4ea4a58809087eb355"

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
