# Copyright 2022-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Command line admin tool for Synapse"
HOMEPAGE="https://codeberg.org/synadm/synadm"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/tabulate[${PYTHON_USEDEP}]
	>=dev-python/click-option-group-0.5.2[${PYTHON_USEDEP}]
	dev-python/dnspython[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
