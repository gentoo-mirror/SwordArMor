# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Nagios/Icinga plugin for checking DANE/TLSA records"
HOMEPAGE="https://github.com/debfx/check_dane"
MY_GITHUB_AUTHOR="debfx"
SRC_URI="https://github.com/${MY_GITHUB_AUTHOR}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-lang/python-3.4
	dev-libs/openssl
	dev-python/dnspython
"
BDEPEND=""

src_install() {
	exeinto /usr/lib64/nagios/plugins/
	doexe check_dane

	dodoc README.md
}
