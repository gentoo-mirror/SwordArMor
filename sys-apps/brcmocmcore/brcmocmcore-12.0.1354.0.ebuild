# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="HPE Storage Emulex(BRCM) OneCommand Manager"
HOMEPAGE="https://support.hpe.com/hpsc/swd/public/detail?swItemId=MTX-e9ee92fe1202416da05b56b08c"
SRC_URI="https://herbizarre.swordarmor.fr/garbage/${P}-1.x86_64.tar.xz"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	net-libs/libnsl:0/2
	sys-libs/brcmocmcorelibs
	sys-libs/hbaapiwrapper
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install() {
	rm -r "${S}/usr/lib/.build-id" || die "rm of /usr/lib/.build-id failed"
	cp -a "${S}/"* "${D}/" || die "Install failed!"
}
