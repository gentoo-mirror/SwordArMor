# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools git-r3

DESCRIPTION="Export ethtool stuff through SNMP"
HOMEPAGE="https://github.com/vincentbernat/ethtool-snmpd"
EGIT_REPO_URI="https://github.com/vincentbernat/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

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

src_install() {
	insinto /usr/share/snmp/mibs
	newins ETHTOOL-MIB ETHTOOL-MIB.txt

	newinitd "${FILESDIR}"/${PN}-initd-1 ${PN}
	newconfd "${FILESDIR}"/${PN}-confd-1 ${PN}

	default
}
