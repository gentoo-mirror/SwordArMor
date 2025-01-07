# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="Format-agnostic tabular dataset library"
HOMEPAGE="https://pypi.org/project/tablib/ https://github.com/jazzband/tablib/"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	test? (
		dev-python/odfpy[${PYTHON_USEDEP}]
		>=dev-python/openpyxl-2.6.0[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/tabulate[${PYTHON_USEDEP}]
		dev-python/xlrd[${PYTHON_USEDEP}]
		dev-python/xlwt[${PYTHON_USEDEP}]
	)
"

src_prepare() {
	sed -i -e 's:addopts = -rsxX --showlocals --tb=native --cov=tablib --cov=tests --cov-report xml --cov-report term --cov-report html:addopts = -rsxX --showlocals --tb=native:' pytest.ini || die
	distutils-r1_src_prepare
}

distutils_enable_tests pytest
