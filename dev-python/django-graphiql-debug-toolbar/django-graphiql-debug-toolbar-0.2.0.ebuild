# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1 pypi

DESCRIPTION="Django Debug Toolbar for GraphiQL IDE"
HOMEPAGE="https://pypi.org/project/django-graphiql-debug-toolbar/"
SRC_URI="$(pypi_sdist_url --no-normalize)"
S="${WORKDIR}/${P/_/-}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-python/django-2.2[${PYTHON_USEDEP}]
	>=dev-python/graphene-django-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/django-debug-toolbar-3.1[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
