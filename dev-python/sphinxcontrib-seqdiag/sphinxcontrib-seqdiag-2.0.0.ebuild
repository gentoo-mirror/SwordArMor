# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} pypy3 )
inherit distutils-r1

DESCRIPTION="A sphinx extension for embedding sequence diagram using seqdiag."
HOMEPAGE="https://github.com/blockdiag/sphinxcontrib-seqdiag"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/seqdiag"
RDEPEND="
	${DEPEND}
	dev-python/namespace-sphinxcontrib[${PYTHON_USEDEP}]
"
BDEPEND=""

python_install_all() {
	distutils-r1_python_install_all
	find "${ED}" -name '*.pth' -delete || die
}
