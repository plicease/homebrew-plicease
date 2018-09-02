# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Libuuid < Formula
  desc "Generate UUID thingies"
  homepage "https://sourceforge.net/projects/libuuid/"
  url "http://sourceforge.net/projects/libuuid/files/libuuid-1.0.3.tar.gz"
  sha256 "46af3275291091009ad7f1b899de3d0cea0252737550e7919d17237997db5644"
  # depends_on "cmake" => :build

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    system "true"
  end
end
