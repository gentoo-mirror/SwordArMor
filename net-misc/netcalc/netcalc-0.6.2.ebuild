# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1 pypi

DESCRIPTION="Advanced network calculator and address planning helper"
HOMEPAGE="https://pypi.org/project/netcalc/
https://github.com/israel-lugo/netcalc"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-python/netaddr-0.7.12[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
