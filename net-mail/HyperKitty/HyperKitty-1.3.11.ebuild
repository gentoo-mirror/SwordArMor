# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="A web interface to access GNU Mailman v3 archives"
HOMEPAGE="https://www.list.org https://gitlab.com/mailman/hyperkitty"
S="${WORKDIR}/HyperKitty-${PV}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	<dev-python/mistune-3.0
	>=dev-python/mistune-2.0.0[${PYTHON_USEDEP}]
	dev-lang/sassc
	dev-python/django-compressor[${PYTHON_USEDEP}]
	dev-python/django-extensions[${PYTHON_USEDEP}]
	dev-python/django-gravatar2[${PYTHON_USEDEP}]
	dev-python/django-haystack[${PYTHON_USEDEP}]
	dev-python/django-q[${PYTHON_USEDEP}]
	dev-python/django[${PYTHON_USEDEP}]
	dev-python/djangorestframework[${PYTHON_USEDEP}]
	dev-python/flufl-lock[${PYTHON_USEDEP}]
	dev-python/networkx[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/robot-detection[${PYTHON_USEDEP}]
	dev-python/whoosh[${PYTHON_USEDEP}]
	net-mail/django-mailman3[${PYTHON_USEDEP}]
	net-mail/mailmanclient[${PYTHON_USEDEP}]
"

BDEPEND="dev-python/isort[${PYTHON_USEDEP}]
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
		dev-python/django-debug-toolbar[${PYTHON_USEDEP}]
	)"

DOCS=( README.rst )
