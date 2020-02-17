# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools user fcaps

DESCRIPTION="FORT validator is an open source RPKI validator."
HOMEPAGE="https://fortproject.net/validator?2"
SRC_URI="https://github.com/NICMx/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

MY_PN="fort"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="caps libressl"

DEPEND="
	caps? ( sys-libs/libcap )
	dev-libs/jansson
	!libressl?	( dev-libs/openssl:0= )
	libressl?	( dev-libs/libressl:0= )
	net-misc/rsync
"
RDEPEND="${DEPEND}"
BDEPEND="
	sys-devel/autoconf
	sys-devel/automake
"

src_prepare() {
	default

	eautoreconf
}

pkg_setup() {
	enewgroup fort
	enewuser fort -1 /bin/sh /var/lib/${MY_PN}/ fort
}

src_install() {
	newinitd "${FILESDIR}/${MY_PN}-initd" ${MY_PN}
	newconfd "${FILESDIR}/${MY_PN}-confd" ${MY_PN}

	emake DESTDIR="${D}" install
	insinto /usr/share/${MY_PN}/tal
	doins tal/*

	dodir /etc/fort
	insinto /etc/fort
	newins "${FILESDIR}/fort-config.json" config.json
}

pkg_postinst() {
	fcaps cap_net_bind_service usr/bin/fort
}
