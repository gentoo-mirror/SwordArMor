# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Shared Secret Authenticator passwordd provider for Matrix Synapse"
HOMEPAGE="
	https://pypi.org/project/shared-secret-authenticator/
"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=net-im/synapse-1.46
"
