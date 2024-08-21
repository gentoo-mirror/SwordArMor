# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1 pypi

DESCRIPTION="Django project that contains default and url settings for Mailman3 Web Interface"
HOMEPAGE="https://pypi.org/project/mailman-web/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="mysql"

RDEPEND="
	>=dev-python/django-4.0[${PYTHON_USEDEP}]
	<dev-python/django-4.3
	dev-python/whoosh[${PYTHON_USEDEP}]
	net-mail/HyperKitty[${PYTHON_USEDEP}]
	net-mail/postorius[${PYTHON_USEDEP}]
"
