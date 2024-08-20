# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="Essential Gravatar support for Django"
HOMEPAGE="https://github.com/twaddington/django-gravatar"
SRC_URI="$(pypi_sdist_url --no-normalize)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/django[${PYTHON_USEDEP}]"

DOCS="README.rst"
