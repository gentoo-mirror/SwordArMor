# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit fcaps

DESCRIPTION="A routing daemon implementing OSPF, RIPv2 & BGP for IPv4 & IPv6"
HOMEPAGE="https://bird.network.cz"
GIT_HASH="71c9484b00b4428ae6c7d7c8eea6d96073683a54"
SRC_URI="https://gitlab.nic.cz/labs/${PN}/bird/-/archive/${GIT_HASH}/${PN}-${GIT_HASH}.tar.bz2 -> ${P}.tar.bz2"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS=""
IUSE="+client debug libssh"

RDEPEND="
	client? ( sys-libs/ncurses:= )
	client? ( sys-libs/readline:= )
	filecaps? (
		acct-group/bird
		acct-user/bird
	)
	libssh? ( net-libs/libssh:= )"
BDEPEND="
	sys-devel/bison
	sys-devel/flex
	sys-devel/m4
"

FILECAPS=(
	CAP_NET_ADMIN			usr/sbin/bird
	CAP_NET_BIND_SERVICE	usr/sbin/bird
	CAP_NET_RAW				usr/sbin/bird
)

src_configure() {
	econf \
		--localstatedir="${EPREFIX}/var" \
		$(use_enable client) \
		$(use_enable debug) \
		$(use_enable libssh)
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

pkg_postinst() {
	use filecaps && \
		einfo "If you want to run bird as non-root, edit"
		einfo "'${EROOT}/etc/conf.d/bird' and set BIRD_GROUP and BIRD_USER with"
		einfo "the wanted username."
}