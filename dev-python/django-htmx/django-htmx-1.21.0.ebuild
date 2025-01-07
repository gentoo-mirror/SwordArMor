# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Extensions for using Django with htmx"
HOMEPAGE="https://pypi.org/project/django-htmx/"
SRC_URI="$(pypi_sdist_url)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="test"

RDEPEND="
	>=dev-python/asgiref-3.6[${PYTHON_USEDEP}]
	>=dev-python/django-4.2[${PYTHON_USEDEP}]
"
