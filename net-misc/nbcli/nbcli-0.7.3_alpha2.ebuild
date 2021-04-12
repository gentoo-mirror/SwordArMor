# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..8} )
inherit distutils-r1

MY_P="${P/_alpha/.dev}"

DESCRIPTION="Extensible command-line interface for Netbox"
HOMEPAGE="https://github.com/ericgeldmacher/nbcli"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="
>=dev-python/pynetbox-5.0.3
dev-python/pyyaml
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${MY_P}"

python_prepare_all() {
	if ! use test; then
		rm -r "${S}/tests"
	fi

	distutils-r1_python_prepare_all
}
