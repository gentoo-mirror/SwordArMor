# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1 git-r3

MY_PN=${PN/nagios-/}

DESCRIPTION="A nagios-like plugin to check that zones are synced"
HOMEPAGE="https://github.com/alarig/check_dns_sync"
MY_GITHUB_AUTHOR="alarig"
EGIT_REPO_URI="https://github.com/${MY_GITHUB_AUTHOR}/${MY_PN}.git"

LICENSE="BSD-2"
SLOT="0"

RDEPEND="
	${DEPEND}
	dev-python/nagiosplugin[${PYTHON_USEDEP}]
	net-dns/bind-tools
"

src_install() {
	default
	python_scriptinto /usr/lib64/nagios/plugins/
	python_foreach_impl python_newscript src/check_dns_sync/check_dns_sync.py \
		check_dns_sync
}
