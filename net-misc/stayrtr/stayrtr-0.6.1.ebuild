# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit fcaps go-module systemd

DESCRIPTION="RPKI-To-Router server implementation in Go"
HOMEPAGE="https://github.com/bgp/stayrtr"
SRC_URI="https://github.com/bgp/stayrtr/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://herbizarre.swordarmor.fr/garbage/${P}-deps.tar.xz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	acct-user/${PN}
	net-misc/rpki-client
"
DEPEND="${RDEPEND}"


FILECAPS=(
	-m 755 'cap_net_bind_service=+ep' usr/bin/"${PN}"
)

src_compile() {
	ego build -trimpath -ldflags "-X main.version=${PV}" ${GOFLAGS} ./cmd/stayrtr/stayrtr.go
	ego build -trimpath -ldflags "-X main.version=${PV}" ${GOFLAGS} ./cmd/rtrdump/rtrdump.go
	ego build -trimpath -ldflags "-X main.version=${PV}" ${GOFLAGS} ./cmd/rtrmon/rtrmon.go
}

src_install() {
	dobin stayrtr
	dobin rtrdump
	dobin rtrmon

	newinitd "${FILESDIR}/${PN}-init.d" ${PN}
	newconfd "${FILESDIR}/${PN}-conf.d" ${PN}
	systemd_dounit "${FILESDIR}/${PN}.service"
}
