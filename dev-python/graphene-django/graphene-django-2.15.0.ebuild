# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="Graphene Django integration"
HOMEPAGE="https://pypi.org/project/graphene-django/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=">=dev-python/djangorestframework-3.6.3[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
BDEPEND=""
