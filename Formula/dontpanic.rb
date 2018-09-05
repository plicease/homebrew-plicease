class Dontpanic < Formula
  desc "libdontpanic - used for testing Alien::Base"
  homepage "https://alienfile.org/dontpanic/"
  url "https://github.com/Perl5-Alien/dontpanic/archive/1.02.tar.gz"
  sha256 "d6f7603c0bf0d3994631bdeab59d38fa7ce5eccf53be04047dd1e83b312a7b5a"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    system "dontpanic"
  end
end
