# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3 optfeature xdg-utils

DESCRIPTION="Desktop GUI client for browsing Geminispace"
HOMEPAGE="https://gmi.skyjake.fi/lagrange/
https://git.skyjake.fi/skyjake/lagrange"
SRC_URI="
https://git.skyjake.fi/skyjake/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
"
EGIT_REPO_URI="https://git.skyjake.fi/skyjake/the_Foundation"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
dev-libs/libpcre
dev-libs/libunistring
dev-libs/openssl
media-libs/libsdl2
sys-libs/zlib
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}"
EGIT_CHECKOUT_DIR="${S}/lib/the_Foundation/"
EGIT_COMMIT="bd766aba7fa5815f0582d981162226bc0bcd60f2"

src_unpack() {
	unpack ${A}
	git-r3_fetch
	git-r3_checkout
}

pkg_postinst() {
	elog "Optional dependencies:"
	optfeature "MPEG audio support" media-sound/mpg123
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	exit 0
}
