# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils user

DESCRIPTION="RPKI client implementation"
HOMEPAGE="https://github.com/kristapsdz/rpki-client"
#SRC_URI="https://github.com/kristapsdz/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI="https://github.com/kristapsdz/${PN}/archive/VERSION_0_2_0.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	./configure CPPFLAGS="`pkg-config --cflags openssl`" \
		LDFLAGS="`pkg-config --libs-only-L openssl`"
}

src_unpack() {
	unpack ${A}
	mv ${WORKDIR}/${PN}-VERSION_0_2_0 ${S}
	cd "${S}"
	eapply -p0 "${FILESDIR}/${P}-Makefile.patch"
}

pkg_setup() {
	enewgroup _rpki-client
	enewuser _rpki-client
}

src_install() {
	emake DESTDIR="${D}" BINDIR="/usr/bin" MANDIR="/usr/share/man" install
}
