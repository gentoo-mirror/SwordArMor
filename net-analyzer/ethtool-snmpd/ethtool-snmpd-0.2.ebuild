# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Export ethtool stuff through SNMP"
HOMEPAGE="https://github.com/vincentbernat/ethtool-snmpd"
SRC_URI="https://github.com/vincentbernat/ethtool-snmpd/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/libpcre
	dev-libs/openssl
	net-analyzer/net-snmp
"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		--with-ethtool-snmpd-pid-file=/run/${PN}.pid
}

src_install() {
	insinto /usr/share/snmp/mibs
	newins ETHTOOL-MIB ETHTOOL-MIB.txt

	newinitd "${FILESDIR}"/${PN}-initd-1 ${PN}
	newconfd "${FILESDIR}"/${PN}-confd-1 ${PN}

	default
}
