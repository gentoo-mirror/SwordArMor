# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="A collection of custom extensions for the Django Framework"
HOMEPAGE="https://github.com/django-extensions/django-extensions"
SRC_URI="$(pypi_sdist_url --no-normalize)"
S="${WORKDIR}/${P/_/-}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/django[${PYTHON_USEDEP}]"

DOCS=( README.rst CHANGELOG.md )
