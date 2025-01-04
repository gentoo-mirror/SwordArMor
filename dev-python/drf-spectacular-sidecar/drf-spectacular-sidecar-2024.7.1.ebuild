# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Serve self-contained distribution builds of Swagger UI and Redoc"
HOMEPAGE="
	https://pypi.org/project/drf-spectacular-sidecar/
"
SRC_URI="$(pypi_sdist_url)"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/django-2.2[${PYTHON_USEDEP}]
"
