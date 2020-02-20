# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{6,7,8} )
inherit distutils-r1

DESCRIPTION="A sphinx extension for embedding network related diagrams using nwdiag."
HOMEPAGE="https://github.com/blockdiag/sphinxcontrib-nwdiag"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/nwdiag"
RDEPEND="${DEPEND}"
BDEPEND=""
