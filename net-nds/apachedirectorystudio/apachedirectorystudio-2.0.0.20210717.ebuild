# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

MY_PV="${PV//.20/.v20}"
MY_PN="ApacheDirectoryStudio"
MY_PKGM=17

DESCRIPTION="Apache Directory Studio is an universal LDAP directory tool."
HOMEPAGE="https://directory.apache.org/studio/"
SRC_URI="https://downloads.apache.org/directory/studio/${MY_PV}-M${MY_PKGM}/${MY_PN}-${MY_PV}-M${MY_PKGM}-linux.gtk.x86_64.tar.gz"
S="${WORKDIR}/${MY_PN}"
LICENSE="Apache-2.0"
SLOT="2"
KEYWORDS="~amd64"

RDEPEND="
	>=virtual/jre-1.8.0
	app-crypt/libsecret
	x11-libs/gtk+:3
"

MY_ARCH="$ARCH"
INSTALL_DIR="/opt/${MY_PN}"

src_install() {

	insinto "${INSTALL_DIR}"
	newicon "features/org.apache.directory.studio.schemaeditor.feature_${MY_PV}-M${MY_PKGM}/studio.png" "${MY_PN}.png"

	make_desktop_entry "${MY_PN}" "Apache Directory Studio" "${MY_PN}" "System"

	doins -r *

	fperms +x "${INSTALL_DIR}/${MY_PN}"

	dosym "${INSTALL_DIR}/${MY_PN}" "/usr/bin/${MY_PN}"
}
