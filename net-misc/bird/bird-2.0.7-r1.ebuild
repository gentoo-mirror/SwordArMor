# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils

DESCRIPTION="A routing daemon implementing OSPF, RIPv2 & BGP for IPv4 & IPv6"
HOMEPAGE="https://bird.network.cz"
SRC_URI="ftp://bird.network.cz/pub/${PN}/${P}.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~x64-macos"
IUSE="+client debug libssh"

RDEPEND="
	acct-group/bird
	acct-user/bird
	client? ( sys-libs/ncurses )
	client? ( sys-libs/readline )
	libssh? ( net-libs/libssh )
"
DEPEND="sys-devel/flex
	sys-devel/bison
	sys-devel/m4"

src_configure() {
	econf \
		--localstatedir="${EPREFIX}/var" \
		$(use_enable client) \
		$(use_enable debug) \
		$(use_enable libssh)
}

src_prepare() {
	eapply "${FILESDIR}/ipv6-rpki-${PV}.patch"
	eapply_user
}

src_install() {
	if use client; then
		dobin birdc
	fi
	dobin birdcl
	dosbin bird
	newinitd "${FILESDIR}/initd-${PN}-2" ${PN}
	newconfd "${FILESDIR}/confd-${PN}-2" ${PN}
	dodoc doc/bird.conf.example
}
