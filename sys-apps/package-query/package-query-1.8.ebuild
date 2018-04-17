# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4

inherit autotools autotools-utils eutils flag-o-matic

DESCRIPTION="Query ALPM and AUR"
HOMEPAGE="https://github.com/archlinuxfr/package-query/"
SRC_URI="https://mir.archlinux.fr/~tuxce/releases/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/yajl
	>=sys-apps/pacman-5.0
"

RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}

src_configure() {
	append-flags "-std=c99"
	local myeconfargs=(
		--prefix=/usr
		--sysconfdir=/etc
		--localstatedir=/var
		--with-aur-url=https://aur.archlinux.org
	)
	autotools-utils_src_configure
}

src_install() {
	autotools-utils_src_install
}
