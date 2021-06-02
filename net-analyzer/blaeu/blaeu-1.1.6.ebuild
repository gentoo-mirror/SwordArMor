# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{8,9} )
inherit distutils-r1

DESCRIPTION="Blaeu, creating measurements on RIPE Atlas probes"
HOMEPAGE="https://framagit.org/bortzmeyer/blaeu"
SRC_URI="https://framagit.org/bortzmeyer/${PN}/-/archive/release-${PV}/${PN}-release-${PV}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/pyopenssl[${PYTHON_USEDEP}]
		dev-python/cymruwhois[${PYTHON_USEDEP}]
		dev-python/dnspython[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	mv ${PN}-release-${PV} ${P}
}
