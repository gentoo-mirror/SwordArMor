# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )
inherit python-r1

DESCRIPTION="Draw a graph from RIS BGP data"
HOMEPAGE="https://git.grifon.fr/alarig/ris-pydot-graph"
SRC_URI="https://git.grifon.fr/alarig/${PN}/archive/0.1.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-python/cymruwhois
	dev-python/pydot
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	default
	python_foreach_impl python_newscript ris.py "${PN}"
}
