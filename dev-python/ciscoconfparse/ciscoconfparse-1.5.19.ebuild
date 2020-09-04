# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_7 )
inherit distutils-r1

DESCRIPTION="Parse, audit, query, build, and modify Cisco IOS-style configurations"
HOMEPAGE="http://www.pennington.net/py/ciscoconfparse/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
dev-python/colorama
dev-python/passlib
dev-python/dnspython
"
RDEPEND="${DEPEND}"
BDEPEND=""