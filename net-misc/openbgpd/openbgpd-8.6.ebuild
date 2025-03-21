# Copyright 2020-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd

MY_PV="${PV/_p/p}"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="OpenBGPD is a free implementation of BGPv4"
HOMEPAGE="http://www.openbgpd.org/index.html"
SRC_URI="mirror://openbsd/OpenBGPD/${PN}-${MY_PV}.tar.gz"

S="${WORKDIR}/${MY_P}"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	!!net-misc/frr
	acct-group/_bgpd
	acct-user/_bgpd
	dev-libs/libevent
	net-libs/libmnl
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-build/libtool
"

src_configure() {
	local myargs=(
		--localstatedir="${EPREFIX}/var"
	)

	econf "${myargs[@]}"
}

src_install() {
	default

	newinitd "${FILESDIR}/${PN}-init.d" bgpd
	newconfd "${FILESDIR}/${PN}-conf.d" bgpd
	systemd_newunit "${FILESDIR}/${PN}.service" bgpd.service
}

pkg_postinst() {
	if [ -z "${REPLACING_VERSIONS}" ]; then
		ewarn ""
		ewarn "OpenBGPD portable (not running on OpenBSD) can’t export its RIB"
		ewarn "to the FIB. It’s only suitable for route-reflectors or"
		ewarn "route-servers."
		ewarn ""
	fi
}
