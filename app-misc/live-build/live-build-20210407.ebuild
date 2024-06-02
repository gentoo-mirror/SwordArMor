# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Debian live system build components"
HOMEPAGE="https://wiki.debian.org/DebianLive"
SRC_URI="mirror://debian/pool/main/l/${PN}/${PN}_${PV}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-util/debootstrap"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}"

PATCHES=(
	"${FILESDIR}"/Makefile.patch
)

src_prepare() {
	default_src_prepare

	export bindir="${EPREFIX}"/usr/bin
	export datadir="${EPREFIX}"/usr/share
	export docdir="${EPREFIX}"/usr/share/doc/${PF}
	export libdir="$(get_libdir)/${PN}"
	export mandir="${EPREFIX}"/usr/share/man

	sed -i "s|usr/lib/live|${libdir}|g" "${S}"/frontend/lb || die
}
