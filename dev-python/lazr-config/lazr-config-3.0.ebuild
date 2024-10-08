# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

MY_PN=${PN/-/.}

DESCRIPTION="Create configuration schemas, and process and validate configurations"
HOMEPAGE="https://code.launchpad.net/lazr.config"
SRC_URI="$(pypi_sdist_url --no-normalize lazr.config ${PV})"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/lazr-delegates[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
	!dev-python/namespace-lazr
"

distutils_enable_tests pytest

src_prepare() {
	# strip rdep specific to namespaces
	sed -i -e "/'setuptools'/d" setup.py || die
	distutils-r1_src_prepare
}

python_compile() {
	distutils-r1_python_compile
	find "${BUILD_DIR}" -name '*.pth' -delete || die
}

python_test() {
	cd "${BUILD_DIR}/install$(python_get_sitedir)" || die
	distutils_write_namespace lazr
	epytest
}
