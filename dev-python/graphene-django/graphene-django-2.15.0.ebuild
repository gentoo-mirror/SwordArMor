# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="Graphene Django integration"
HOMEPAGE="https://pypi.org/project/graphene-django/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	<dev-python/graphene-4
	<dev-python/graphql-core-4
	>=dev-python/django-2.2[${PYTHON_USEDEP}]
	>=dev-python/djangorestframework-3.6.3[${PYTHON_USEDEP}]
	>=dev-python/graphene-3.0.0_beta5[${PYTHON_USEDEP}]
	>=dev-python/graphql-core-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/promise-2.1[${PYTHON_USEDEP}]
	dev-python/text-unidecode[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/${P}-pytest-runner.patch"
)
