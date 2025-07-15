# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
inherit python-r1

MY_PN=${PN/nagios-/}

DESCRIPTION="Nagios/Icinga plugin for checking DANE/TLSA records"
HOMEPAGE="https://github.com/debfx/check_dane"
MY_GITHUB_AUTHOR="debfx"
SRC_URI="https://github.com/${MY_GITHUB_AUTHOR}/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	dev-libs/openssl
	dev-python/dnspython[${PYTHON_USEDEP}]
"
RDEPEND="${PYTHON_DEPS}"

src_install() {
	python_scriptinto /usr/$(get_libdir)/nagios/plugins/
	python_foreach_impl python_doscript check_dane

	dodoc README.md
}
