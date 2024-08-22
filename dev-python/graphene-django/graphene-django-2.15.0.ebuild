# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1 pypi

DESCRIPTION="Graphene Django integration"
HOMEPAGE="https://pypi.org/project/graphene-django/"
SRC_URI="$(pypi_sdist_url --no-normalize)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-python/six-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/graphene-2.1.7[${PYTHON_USEDEP}]
	<dev-python/graphene-3
	>=dev-python/graphql-core-2.1.0[${PYTHON_USEDEP}]
	<dev-python/graphql-core-3
	>=dev-python/django-1.11[${PYTHON_USEDEP}]
	>=dev-python/promise-2.1[${PYTHON_USEDEP}]
	dev-python/text-unidecode[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/${P}-pytest-runner.patch"
)
