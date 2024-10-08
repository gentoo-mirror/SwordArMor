# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1 pypi

DESCRIPTION="Django project that contains default and url settings for Mailman3 Web Interface"
HOMEPAGE="https://pypi.org/project/mailman-web/"
SRC_URI="$(pypi_sdist_url --no-normalize ${MY_PN})"
S="${WORKDIR}/${P/_/-}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="mysql"

RDEPEND="
	mysql? ( dev-python/mysqlclient[${PYTHON_USEDEP}] )
	dev-python/cmarkgfm[${PYTHON_USEDEP}]
	net-mail/django-mailman3[${PYTHON_USEDEP}]
	net-mail/HyperKitty[${PYTHON_USEDEP}]
	net-mail/postorius[${PYTHON_USEDEP}]
"
