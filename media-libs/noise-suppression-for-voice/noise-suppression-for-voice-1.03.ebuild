# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="A real-time noise suppression plugin for voice"
HOMEPAGE="https://github.com/werman/noise-suppression-for-voice"

if [ "${PV}" = "9999" ]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/werman/noise-suppression-for-voice.git"
else
	KEYWORDS="~amd64 ~x86"
	SRC_URI="https://github.com/werman/noise-suppression-for-voice/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="GPL-3+"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dodoc README.md

	cd "${BUILD_DIR}"

	insinto /usr/$(get_libdir)/lv2/
	doins bin/rnnoise_mono.lv2/librnnoise_mono.so
	doins bin/rnnoise_stereo.lv2/librnnoise_stereo.so

	insinto /usr/$(get_libdir)/vst3/
	doins bin/rnnoise.vst3/Contents/x86_64-linux/rnnoise.so

	insinto /usr/$(get_libdir)/vst/
	doins -r bin/vst

	insinto /usr/$(get_libdir)/ladspa/
	doins bin/ladspa/librnnoise_ladspa.so
}
