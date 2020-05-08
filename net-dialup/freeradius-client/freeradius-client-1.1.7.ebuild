# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="FreeRADIUS Client framework"
HOMEPAGE="https://wiki.freeradius.org/project/Radiusclient"
SRC_URI="ftp://ftp.freeradius.org/pub/freeradius/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ppc ppc64 sparc x86"

IUSE="scp shadow static-libs"

DEPEND="!net-dialup/radiusclient-ng"
RDEPEND="${DEPEND}"

DOCS=(
	BUGS doc/ChangeLog doc/login.example doc/release-method.txt doc/instop.html
)

src_prepare() {
	default
	mv configure.in configure.ac
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable scp) \
		$(use_enable shadow) \
		--with-secure-path
}

src_install() {
	default
	emake DESTDIR="${D}" install
	newdoc doc/README README.login.example
	rm doc/README
	dodoc README*
}
