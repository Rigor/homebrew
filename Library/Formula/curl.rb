require 'formula'

class Curl < Formula
  homepage 'http://curl.haxx.se/'
  url 'http://curl.haxx.se/download/curl-7.35.0.tar.gz'
  mirror 'ftp://ftp.sunet.se/pub/www/utilities/curl/curl-7.35.0.tar.gz'
  sha256 '917d118fc5d61e9dd1538d6519bd93bbebf2e866882419781c2e0fdb2bc42121'

  keg_only :provided_by_osx

  option 'with-ssh', 'Build with scp and sftp support'
  option 'with-ares', 'Build with C-Ares async DNS support'
  option 'with-gssapi', 'Build with GSSAPI/Kerberos authentication support.'

  depends_on 'openssl'
  depends_on 'zlib'
  depends_on 'libidn'
  depends_on 'rtmpdump'

  depends_on 'pkg-config' => :build

  def install
    args = %W[
      --disable-debug
      --disable-dependency-tracking
      --prefix=#{prefix}
      --enable-threaded-resolver
      --with-gssapi
      --with-ssl=#{Formula["openssl"].opt_prefix}
    ]

    system "./configure", *args
    system "make install"
  end
end
