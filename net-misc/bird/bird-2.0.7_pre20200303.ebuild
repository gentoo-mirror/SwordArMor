# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools fcaps git-r3

DESCRIPTION="A routing daemon implementing OSPF, RIPv2 & BGP for IPv4 & IPv6"
HOMEPAGE="https://bird.network.cz"
LICENSE="GPL-2"
EGIT_REPO_URI="https://gitlab.labs.nic.cz/labs/bird.git"
EGIT_COMMIT="78e4a123bb937bb45f7eaebb0ea475095443bfd0"

SLOT="0"
KEYWORDS=""
IUSE="+client debug libssh"

RDEPEND="
	client? ( sys-libs/ncurses )
	client? ( sys-libs/readline )
	filecaps? (
		acct-group/bird
		acct-user/bird
	)
	libssh? ( net-libs/libssh )
"
DEPEND="sys-devel/flex
	sys-devel/bison
	sys-devel/m4"

src_prepare() {
	default
	eautoreconf
}

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

FILECAPS=(
	CAP_NET_ADMIN			usr/sbin/bird
	CAP_NET_BIND_SERVICE	usr/sbin/bird
	CAP_NET_RAW				usr/sbin/bird
)

pkg_postinst() {
	use filecaps && \
		einfo "If you want to run bird as non-root, edit"
		einfo "'${EROOT}/etc/conf.d/bird' and set BIRD_GROUP and BIRD_USER with"
		einfo "the wanted username."
}
