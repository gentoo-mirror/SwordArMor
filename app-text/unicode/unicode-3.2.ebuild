# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="display unicode character properties"
HOMEPAGE="https://tracker.debian.org/pkg/unicode"
SRC_URI="mirror://debian/pool/main/u/${PN}/${PN}_${PV}.orig.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-i18n/unicode-data"
RDEPEND="${DEPEND}"

DOCS=(README{,-paracode} debian/changelog)

src_install() {
	doman unicode.1
	distutils-r1_src_install
}
