# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..10} )
inherit distutils-r1 optfeature

DESCRIPTION="Python Wrapper for the Proxmox 2.x API (HTTP and SSH)"
HOMEPAGE="
	https://pypi.org/project/proxmoxer/
"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND=""

pkg_postinst() {
	optfeature "https" dev-python/requests
	optfeature "ssh_paramiko" dev-python/paramiko
}
