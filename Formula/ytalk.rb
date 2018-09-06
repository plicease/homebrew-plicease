class Ytalk < Formula
  desc "Multi-user talkd client"
  homepage "https://directory.fsf.org/wiki/Ytalk"
  url "ftp://ftp.ourproject.org/pub/ytalk/ytalk-3.3.0.tar.gz"
  sha256 "6ecb34f71f723a7b96f90e411c78dff2735c08dc4228c765f7fdbf8ca48572b4"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "which", "ytalk"
  end
end
