# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="OpenID support for modern servers and consumers"
HOMEPAGE="https://github.com/necaris/python3-openid"
SRC_URI="$(pypi_sdist_url --no-normalize)"
S="${WORKDIR}/${P/_/-}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-python/defusedxml[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		${RDEPEND}
		dev-python/django[${PYTHON_USEDEP}]
		dev-python/psycopg:2[${PYTHON_USEDEP}]
	)
"

DOCS=( NEWS.md README.md )

python_test() {
	"${EPYTHON}" -m unittest -v openid.test.test_suite || die "Tests failed with ${EPYTHON}"
}
