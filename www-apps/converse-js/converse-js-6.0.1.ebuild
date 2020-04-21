# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit webapp

MY_PN="${PN/-/.}"
MY_P="${MY_PN}-${PV}"
DESCRIPTION="Free and open-source browser XMPP chat client"
HOMEPAGE="https://conversejs.org/"
MY_GITHUB_AUTHOR="conversejs"
SRC_URI="https://github.com/${MY_GITHUB_AUTHOR}/${MY_PN}/releases/download/v${PV}/${MY_P}.tgz"

LICENSE="MPL-2.0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/package"

src_install() {
	webapp_src_preinst

	dodoc README.md
	rm -f README.md

	insinto "${MY_HTDOCSDIR}/"
	doins -r .
	doins "${FILESDIR}/index.html"

	webapp_src_install
}
