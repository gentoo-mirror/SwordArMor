# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7} )
inherit distutils-r1 git-r3

MY_PN=${PN/nagios-/}

DESCRIPTION="A nagios-like plugin to check that zones are synced"
HOMEPAGE="https://github.com/paulla/check_dns_sync"
MY_GITHUB_AUTHOR="paulla"
EGIT_REPO_URI="https://github.com/${MY_GITHUB_AUTHOR}/${MY_PN}.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="
	${DEPEND}
	dev-python/nagiosplugin[${PYTHON_USEDEP}]
	net-dns/bind-tools
"
BDEPEND=""

src_install() {
	default
	exeinto /usr/lib64/nagios/plugins/
	newexe src/check_dns_sync/check_dns_sync.py check_dns_sync
}
