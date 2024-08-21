# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

MY_PN="MarkupPy"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="MarkupPy - An HTML/XML generator"
HOMEPAGE="https://pypi.org/project/MarkupPy/ https://github.com/tylerbakke/MarkupPy"
SRC_URI="$(pypi_sdist_url --no-normalize ${MY_PN})"

S="${WORKDIR}/${MY_P}"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

# MarkupPy does not have any test suite
RESTRICT="test"
