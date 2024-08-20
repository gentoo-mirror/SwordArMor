# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1 pypi
S="${WORKDIR}/${P/_/-}"

DESCRIPTION="Pluggable search for Django"
HOMEPAGE="https://haystacksearch.org/"
SRC_URI="$(pypi_sdist_url --no-normalize)"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=">=dev-python/django-2.2[${PYTHON_USEDEP}]"

# tests have too many dependencies to maintain
RESTRICT="test"

distutils_enable_sphinx docs --no-autodoc
