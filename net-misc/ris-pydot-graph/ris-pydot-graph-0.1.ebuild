# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
inherit python-r1

DESCRIPTION="Draw a graph from RIS BGP data"
HOMEPAGE="https://git.grifon.fr/alarig/ris-pydot-graph"
SRC_URI="https://git.grifon.fr/alarig/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-python/cymruwhois
	dev-python/pydot
"
RDEPEND="${DEPEND}"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

src_install() {
	default
	python_foreach_impl python_newscript ris.py "${PN}"
}
