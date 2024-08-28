# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_SINGLE_IMPL=1
inherit distutils-r1

DESCRIPTION="Dynamic DNS Connector for NetBox"
HOMEPAGE="https://github.com/sjm-steffann/netbox-ddns"
SRC_URI="https://github.com/sjm-steffann/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	www-apps/netbox[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/dnspython[${PYTHON_USEDEP}]
	')
"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
