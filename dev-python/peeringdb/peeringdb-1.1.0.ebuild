# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )
inherit distutils-r1

DESCRIPTION="PeeringDB python client"
HOMEPAGE="https://peeringdb.github.io/peeringdb-py/
https://github.com/peeringdb/peeringdb-py"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-python/cfu-0.5.1[${PYTHON_USEDEP}]
	>=dev-python/munge-0.1.5[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.11[${PYTHON_USEDEP}]
	>=dev-python/twentyc-rpc-0.3.4[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""
