# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1 pypi

DESCRIPTION="A legacy Python handler for mkdocstrings"
HOMEPAGE="https://mkdocstrings.github.io/python-legacy"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"	# mkdocstrings no x86

RDEPEND=">=dev-python/mkdocstrings-0.19[${PYTHON_USEDEP}]
	>=dev-python/pytkdocs-0.14[${PYTHON_USEDEP}]
	!dev-python/mkdocstrings-python
"
BDEPEND="
	test? ( dev-python/mkdocs-material[${PYTHON_USEDEP}] )
"

distutils_enable_tests pytest

python_prepare_all() {
	sed -i 's/-expression//;/^license/d' pyproject.toml || die
	use test && { mkdir -p "${S}"/docs || die ; }

	distutils-r1_python_prepare_all
}
