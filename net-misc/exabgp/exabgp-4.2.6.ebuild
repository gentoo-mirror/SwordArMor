# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python2_7 python3_6 )

inherit distutils-r1

DESCRIPTION="The BGP swiss army knife of networking"
HOMEPAGE="https://github.com/Exa-Networks/exabgp"
SRC_URI="https://github.com/Exa-Networks/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	distutils-r1_src_install

	dodoc -r "${S}"/etc/exabgp/
	mv "${D}/usr/share/doc/${P}/exabgp" "${D}/usr/share/doc/${P}/examples"
	rm -r "${D}"/usr/etc
}
