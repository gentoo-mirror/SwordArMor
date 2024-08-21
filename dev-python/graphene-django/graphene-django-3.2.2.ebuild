# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1 pypi

DESCRIPTION="Graphene Django integration"
HOMEPAGE="https://pypi.org/project/graphene-django/"
SRC_URI="$(pypi_sdist_url --no-normalize)"

S="${WORKDIR}/${P/_/-}"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-python/graphql-core-3.1[${PYTHON_USEDEP}]
	<dev-python/graphql-core-3.3
	>=dev-python/graphql-relay-3.1[${PYTHON_USEDEP}]
	<dev-python/graphql-relay-3.3
	>=dev-python/aniso8601-8[${PYTHON_USEDEP}]
	<dev-python/aniso8601-10
"
RDEPEND="${DEPEND}"
