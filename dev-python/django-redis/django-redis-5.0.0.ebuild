# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="Full featured redis cache backend for Django"
HOMEPAGE="https://pypi.org/project/django-redis/
https://github.com/jazzband/django-rediq"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-python/django-2.2[${PYTHON_USEDEP}]
	>=dev-db/redis-3.0.0
"
RDEPEND="${DEPEND}"
BDEPEND=""
