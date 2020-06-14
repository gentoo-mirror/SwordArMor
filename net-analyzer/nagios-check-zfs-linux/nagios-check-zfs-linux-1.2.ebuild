# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )
inherit python-r1

MY_PN=${PN//-/_}

DESCRIPTION="Nagios plugin to check ZFS pool in the Linux environment"
HOMEPAGE="https://github.com/zlacelle/nagios_check_zfs_linux"
MY_GITHUB_AUTHOR="zlacelle"
SRC_URI="https://github.com/${MY_GITHUB_AUTHOR}/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${MY_PN}-${PV}"

src_install() {
	python_scriptinto /usr/lib64/nagios/plugins/
	python_foreach_impl python_newscript check_zfs.py check_zfs

	dodoc README.md
}
