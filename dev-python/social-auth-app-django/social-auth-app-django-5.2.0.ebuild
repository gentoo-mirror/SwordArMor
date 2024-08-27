# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

MY_PN="${PN//-auth/}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Python Social Auth - Application - Django"
HOMEPAGE="https://github.com/python-social-auth/social-app-django"
SRC_URI="https://github.com/python-social-auth/${MY_PN}/archive/${PV}.tar.gz -> ${MY_P}.tar.gz"

S="${WORKDIR}/${MY_P}"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/django-3.2[${PYTHON_USEDEP}]
	dev-python/social-auth-core[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_test() {
	"${PYTHON}" manage.py test -v2 || die "tests failed with ${EPYTHON}"
}
