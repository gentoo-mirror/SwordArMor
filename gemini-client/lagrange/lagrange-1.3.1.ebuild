# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake optfeature xdg-utils

DESCRIPTION="Desktop GUI client for browsing Geminispace"
HOMEPAGE="https://gmi.skyjake.fi/lagrange/
https://git.skyjake.fi/skyjake/lagrange"
SRC_URI="https://git.skyjake.fi/skyjake/${PN}/releases/download/v${PV}/${P}.tar.gz"

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

pkg_postinst() {
	elog "Optional dependencies:"
	optfeature "MPEG audio support" media-sound/mpg123
	xdg_desktop_database_update
	xdg_icon_cache_update
}
