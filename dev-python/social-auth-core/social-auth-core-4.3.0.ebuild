# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 optfeature

MY_PN="${PN//-auth/}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Python Social Auth - Core"
HOMEPAGE="https://github.com/python-social-auth/social-core"
SRC_URI="https://github.com/python-social-auth/${MY_PN}/archive/${PV}.tar.gz -> ${MY_P}.tar.gz"

S="${WORKDIR}/${MY_P}"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
>=dev-python/requests-2.9.1[${PYTHON_USEDEP}]
>=dev-python/oauthlib-1.0.3[${PYTHON_USEDEP}]
>=dev-python/requests-oauthlib-0.6.1[${PYTHON_USEDEP}]
>=dev-python/pyjwt-2.0.0[${PYTHON_USEDEP}]
>=dev-python/cryptography-1.4[${PYTHON_USEDEP}]
>=dev-python/defusedxml-0.5.0_rc1[${PYTHON_USEDEP}]
>=dev-python/python3-openid-3.0.10[${PYTHON_USEDEP}]
"
BDEPEND="test? ( dev-python/httpretty[${PYTHON_USEDEP}]
		dev-python/python-jose[${PYTHON_USEDEP}]
		dev-python/python3-saml[${PYTHON_USEDEP}] )"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# need network / credentials
	social_core/tests/backends/test_livejournal.py::LiveJournalOpenIdTest::test_login
	social_core/tests/backends/test_livejournal.py::LiveJournalOpenIdTest::test_partial_pipeline
	social_core/tests/backends/test_ngpvan.py::NGPVANActionIDOpenIDTest::test_association_uid
	social_core/tests/backends/test_ngpvan.py::NGPVANActionIDOpenIDTest::test_extra_data_phone
	social_core/tests/backends/test_ngpvan.py::NGPVANActionIDOpenIDTest::test_login
	social_core/tests/backends/test_ngpvan.py::NGPVANActionIDOpenIDTest::test_partial_pipeline
	social_core/tests/backends/test_ngpvan.py::NGPVANActionIDOpenIDTest::test_user_data
	social_core/tests/backends/test_steam.py::SteamOpenIdTest::test_login
	social_core/tests/backends/test_steam.py::SteamOpenIdTest::test_partial_pipeline
	social_core/tests/backends/test_ngpvan.py::NGPVANActionIDOpenIDTest::test_setup_request
	social_core/tests/backends/test_steam.py::SteamOpenIdMissingSteamIdTest::test_login
	social_core/tests/backends/test_steam.py::SteamOpenIdMissingSteamIdTest::test_partial_pipeline
)

python_install_all() {
	distutils-r1_python_install_all
	find "${ED}" -type d -name "tests" -exec rm -rv {} + || die "tests removing failed"
}

pkg_postinst() {
	optfeature "integration with OpenID Connect" dev-python/python-jose
	optfeature "integration with SAML" dev-python/python3-saml dev-python/lxml
}
