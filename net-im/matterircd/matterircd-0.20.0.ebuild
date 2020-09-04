# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGO_PN="github.com/42wim/${PN}"

inherit go-module user

DESCRIPTION="Connect to your Mattermost or Slack using your IRC-client of choice"
HOMEPAGE="https://github.com/42wim/matterircd"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
${EGO_SUM_SRC_URI}"
RESTRICT="mirror"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug pie static"

DOCS=( README.md )
QA_PRESTRIPPED="usr/bin/.*"

src_compile() {
	env GOBIN="${S}/bin" go build -mod=vendor || die "compile failed"
}

pkg_setup() {
	enewgroup matterircd
	enewuser matterircd -1 -1 -1 matterircd
}

src_install() {
	dobin matterircd
	use debug && dostrip -x /usr/bin/matterircd
	einstalldocs

	newinitd "${FILESDIR}/${PN}.initd" "${PN}"
	newconfd "${FILESDIR}/${PN}.confd" "${PN}"

	insinto /etc/matterircd
	doins matterircd.toml.example

	diropts -o matterircd -g matterircd -m 0750
	keepdir /var/log/matterircd
}
