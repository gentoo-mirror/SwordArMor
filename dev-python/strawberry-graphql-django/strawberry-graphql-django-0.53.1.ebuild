# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..12} )

inherit distutils-r1 pypi

DESCRIPTION="A library for creating GraphQL APIs"
HOMEPAGE="https://pypi.org/project/strawberry-graphql-django/"
SRC_URI="$(pypi_sdist_url)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/django-4.2[${PYTHON_USEDEP}]
	>=dev-python/asgiref-3.8[${PYTHON_USEDEP}]
	>=dev-python/strawberry-graphql-0.236.0[${PYTHON_USEDEP}]
"
