# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module systemd

DESCRIPTION="A Matrix-Slack puppeting bridge based on slack-go"
HOMEPAGE="https://github.com/mautrix/slack"
SRC_URI="https://github.com/mautrix/slack/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://herbizarre.swordarmor.fr/garbage/${P}-deps.tar.xz
"
S="${WORKDIR}/slack-${PV}"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	acct-user/${PN}
	dev-libs/olm
"
DEPEND="${RDEPEND}"

src_compile() {
	ego build ${GOFLAGS} ./cmd/mautrix-slack
}

src_install() {
	dobin mautrix-slack

	keepdir /var/log/mautrix/slack
	fowners -R root:mautrix /var/log/mautrix
	fperms -R 770 /var/log/mautrix

	newinitd "${FILESDIR}/${PN}.initd" "${PN}"
	systemd_dounit "${FILESDIR}/${PN}.service"

	fowners -R root:mautrix /etc/mautrix
	fperms -R 770 /etc/mautrix
}

pkg_postinst() {
	einfo
	elog ""
	elog "Before you can use ${PN}, you must configure it correctly"
	elog "The configuration file is located at \"/etc/mautrix/${PN/-/_}.yaml\""
	elog "When done, run the following command: emerge --config ${CATEGORY}/${PN}"
	elog "Then, you must register the bridge with your homeserver"
	elog "Refer your homeserver's documentation for instructions"
	elog "The registration file is located at /var/lib/${PN/-/\/}/registration.yaml"
	elog "Finally, you may start the ${PN} daemon"
	einfo
}

pkg_config() {
	su - "${PN}" -s /bin/sh -c \
	   "/usr/bin/${PN} -c /etc/mautrix/${PN/-/_}.yaml -g -r /var/lib/${PN/-/\/}/registration.yaml"
}
