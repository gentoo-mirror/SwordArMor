# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit perl-functions optfeature

DESCRIPTION="Swiss Army Knife SMTP; Command line SMTP testing, including TLS and AUTH"
HOMEPAGE="https://www.jetmore.org/john/code/swaks/
https://github.com/jetmore/swaks"
SRC_URI="http://www.jetmore.org/john/code/swaks/${P}.tar.gz"
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 ~ppc ~x86"

RDEPEND="
	virtual/perl-MIME-Base64
	virtual/perl-Digest-MD5
	virtual/perl-Digest-SHA
	dev-perl/Authen-NTLM
	dev-perl/Authen-SASL
	dev-perl/Net-DNS
	dev-perl/Net-SSLeay
	virtual/perl-Time-HiRes
"
	# Net::Netrc
	# IPC::Open2
	# IO::Socket::UNIX
	# IO::Socket::IP
	# POSIX
	# Sys::Hostname
BDEPEND="app-text/txt2man"

src_compile() {
	/usr/bin/txt2man -s 1 -t "${PN}" -v "Mail tools" doc/ref.txt \
		> swaks.1 \
		|| die "man page compulation failed"
}

src_install() {
	dobin swaks
	doman swaks.1
	dodoc README.txt doc/*.txt
}

pkg_postinst() {
	optfeature "ssl" dev-perl/IO-Socket-SSL
}
