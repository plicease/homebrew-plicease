class Pkgconf < Formula
  desc "pkg-config compatible tool and API"
  homepage "http://pkgconf.org/"
  url "https://distfiles.dereferenced.org/pkgconf/pkgconf-1.5.3.tar.gz"
  sha256 "0c5a750af68bbb06be542d359af57003dc66926533b64b00a3fefc776819f41e"

  def install
    pc_path = %W[
      #{HOMEBREW_PREFIX}/lib/pkgconfig
      #{HOMEBREW_PREFIX}/share/pkgconfig
      /usr/local/lib/pkgconfig
      /usr/lib/pkgconfig
      #{HOMEBREW_LIBRARY}/Homebrew/os/mac/pkgconfig/#{MacOS.version}
    ].uniq.join(File::PATH_SEPARATOR)

    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--with-pkg-config-dir=#{pc_path}",
                          "--with-system_libdir=/usr/lib",
                          "--with-system_includedir=/usr/include"
    system "make"
    system "make", "install" 
  end

  test do
    system "#{bin}/pkgconf", "--libs", "libpkgconf"
  end
end
