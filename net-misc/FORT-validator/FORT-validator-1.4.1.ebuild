# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools fcaps systemd

DESCRIPTION="FORT validator is an open source RPKI validator"
HOMEPAGE="https://fortproject.net/validator?2"
SRC_URI="https://github.com/NICMx/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

MY_PN="fort"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="caps libressl"

DEPEND="
	acct-group/fort
	acct-user/fort
	caps? ( sys-libs/libcap )
	dev-libs/jansson
	libressl?	( dev-libs/libressl:0= )
	!libressl?	( dev-libs/openssl:0= )
"
RDEPEND="
	${DEPEND}
	net-misc/rsync
"
BDEPEND="
	sys-devel/autoconf
	sys-devel/automake
"

PATCHES="${FILESDIR}/${PN}-skip-online-test.patch"

src_prepare() {
	default

	eautoreconf
}

src_install() {
	newinitd "${FILESDIR}/${MY_PN}-1.4-initd" ${MY_PN}
	newconfd "${FILESDIR}/${MY_PN}-1.4-confd" ${MY_PN}

	emake DESTDIR="${D}" install
	insinto /usr/share/${MY_PN}/
	insopts -m0644 -o "${MY_PN}"
	diropts -m0755 -o "${MY_PN}"
	doins -r examples/tal/

	dodoc -r examples/

	insinto /etc/fort
	newins "${FILESDIR}/fort-config.json" config.json

	exeinto "/usr/libexec/${MY_PN}"
	doexe fort_setup.sh

	systemd_dounit "${FILESDIR}/${MY_PN}-1.4.service"
}

pkg_postinst() {
	fcaps cap_net_bind_service usr/bin/fort

	einfo ""
	einfo "ARIN TAL is disabled by default because the ARIN Relying Party"
	einfo "Agreement must be accepted beforehead. Start fort, run"
	einfo ""
	einfo "  su -s /bin/sh -c '${EROOT}/usr/libexec/${MY_PN}/fort_setup.sh /usr/share/${MY_PN}/tal/' fort"
	einfo ""
	einfo "as root and restart fort to enable it."
	einfo "The configuration file generation will provide a config file, but a"
	einfo "simpler one is shiped with the ebuid. Use the one you prefer."
}
