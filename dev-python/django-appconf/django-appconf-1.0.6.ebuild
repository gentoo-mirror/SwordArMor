# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A helper class for handling configuration defaults of packaged apps gracefully"
HOMEPAGE="https://django-appconf.readthedocs.io/"
SRC_URI="$(pypi_sdist_url --no-normalize)"
S="${WORKDIR}/${P/_/-}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/django[${PYTHON_USEDEP}]
"

python_test() {
	local -x DJANGO_SETTINGS_MODULE=tests.test_settings
	local -x PYTHONPATH="${S}"
	django-admin test -v 2 || die
}
