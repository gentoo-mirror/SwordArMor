# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{7..9} )
DISTUTILS_USE_SETUPTOOLS=rdepend

inherit distutils-r1

DESCRIPTION="A client for the OpenStack Cinder API"
HOMEPAGE="https://launchpad.net/python-cinderclient
https://github.com/openstack/python-cinderclient"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

CDEPEND=">=dev-python/pbr-2.0.0[${PYTHON_USEDEP}]
	!~dev-python/pbr-2.1.0"
DEPEND="${CDEPEND}"
RDEPEND="
	${CDEPEND}
	>=dev-python/prettytable-0.7.2[${PYTHON_USEDEP}]
	>=dev-python/keystoneauth-3.4.1[${PYTHON_USEDEP}]
	>=dev-python/simplejson-3.5.1[${PYTHON_USEDEP}]
	>=dev-python/oslo-i18n-5.0.1[${PYTHON_USEDEP}]
	>=dev-python/oslo-utils-4.8.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.25.1[${PYTHON_USEDEP}]
	>=dev-python/stevedore-3.3.0[${PYTHON_USEDEP}]
"
