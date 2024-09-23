# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit go-module systemd

DESCRIPTION="Prometheus exporter for Free Range Routing"
HOMEPAGE="https://github.com/tynany/frr_exporter"
SRC_URI="
	https://github.com/tynany/frr_exporter/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://herbizarre.swordarmor.fr/garbage/${P}-vendor.tar.xz
	https://herbizarre.swordarmor.fr/garbage/${P}-deps.tar.xz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	acct-group/frr_exporter
	acct-user/frr_exporter
"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/promu"

src_compile() {
	mkdir -p bin || die
	promu build -v --prefix bin || die
}

src_install() {
	dobin bin/${PN}
	dodoc {README,CHANGELOG}.md
	newinitd "${FILESDIR}"/${PN}.initd ${PN}
	newconfd "${FILESDIR}"/${PN}.confd ${PN}
	systemd_dounit "${FILESDIR}"/${PN}.service
}
