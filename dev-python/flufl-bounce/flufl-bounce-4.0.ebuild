# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1 pypi

MY_PN=${PN/-/.}

DESCRIPTION="Email bounce detectors"
HOMEPAGE="https://gitlab.com/warsaw/flufl.bounce"
S="${WORKDIR}/${MY_PN}-${PV}"
SRC_URI="$(pypi_sdist_url --no-normalize flufl.bounce ${PV})"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/atpublic[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
"

distutils_enable_tests unittest

python_install_all() {
	distutils-r1_python_install_all
	find "${D}" -name '*.pth' -delete || die
}
