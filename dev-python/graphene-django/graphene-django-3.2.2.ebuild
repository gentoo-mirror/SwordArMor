# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..11} )
inherit distutils-r1 pypi

DESCRIPTION="Graphene Django integration"
HOMEPAGE="https://pypi.org/project/graphene-django/"
SRC_URI="$(pypi_sdist_url --no-normalize)"

S="${WORKDIR}/${P/_/-}"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-python/graphene-3.0[${PYTHON_USEDEP}]
	<dev-python/graphene-4
	>=dev-python/graphql-core-3.1.0[${PYTHON_USEDEP}]
	<dev-python/graphql-core-4
	>=dev-python/graphql-relay-3.1.1[${PYTHON_USEDEP}]
	<dev-python/graphql-relay-4
	>=dev-python/django-3.2[${PYTHON_USEDEP}]
	>=dev-python/promise-2.1[${PYTHON_USEDEP}]
	dev-python/text-unidecode[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND="
	test? (
		dev-python/inflection[${PYTHON_USEDEP}]
		dev-python/pytest-django[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
