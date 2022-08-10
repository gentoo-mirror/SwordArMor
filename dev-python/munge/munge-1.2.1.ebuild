# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="data manipulation library and client"
HOMEPAGE="https://pypi.org/project/munge/
https://github.com/20c/munge/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-python/click-5.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.6[${PYTHON_USEDEP}]
	>=dev-python/tomlkit-0.7.2[${PYTHON_USEDEP}]
	<dev-python/tomlkit-0.8.0[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""
