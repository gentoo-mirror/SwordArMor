# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake optfeature xdg-utils

DESCRIPTION="Desktop GUI client for browsing Geminispace"
HOMEPAGE="https://gmi.skyjake.fi/lagrange/
https://git.skyjake.fi/gemini/lagrange"
SRC_URI="https://git.skyjake.fi/gemini/${PN}/releases/download/v${PV}/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+mp3"

DEPEND="dev-libs/libpcre
	dev-libs/libunistring
	dev-libs/openssl
	media-libs/libsdl2
	mp3? ( media-sound/mpg123 )
	sys-libs/zlib
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DENABLE_MPG123=$(usex mp3)
		-DENABLE_IDLE_SLEEP=OFF  # improves perfomance
	)

	cmake_src_configure
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
