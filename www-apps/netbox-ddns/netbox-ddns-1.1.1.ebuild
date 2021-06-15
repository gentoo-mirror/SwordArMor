# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{7..9} )
inherit distutils-r1

DESCRIPTION="Dynamic DNS Connector for NetBox"
HOMEPAGE="https://pypi.org/project/netbox-ddns/
https://github.com/sjm-steffann/netbox-ddns"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="www-apps/netbox"
RDEPEND="${DEPEND}"
BDEPEND=""
