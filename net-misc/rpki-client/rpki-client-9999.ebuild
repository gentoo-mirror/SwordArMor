# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils user git-r3

DESCRIPTION="RPKI client implementation"
HOMEPAGE="https://github.com/kristapsdz/rpki-client"
EGIT_REPO_URI="https://github.com/kristapsdz/${PN}.git"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	./configure CPPFLAGS="`pkg-config --cflags openssl`" \
		LDFLAGS="`pkg-config --libs-only-L openssl`" \
		LDADD="`pkg-config --libs openssl` -lresolv"
}

src_prepare() {
	eapply_user
}

pkg_setup() {
	enewgroup _rpki-client
	enewuser _rpki-client
}

src_install() {
	emake DESTDIR="${D}" BINDIR="/usr/bin" MANDIR="/usr/share/man" install
	insinto /etc/rpki/
	doins tals/*
	keepdir /var/db/${PN}/
	keepdir /var/cache/${PN}/
	fowners -R _rpki-client /etc/rpki/
	fowners -R _rpki-client /var/db/${PN}/
	fowners -R _rpki-client /var/cache/${PN}/
}
