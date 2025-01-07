# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1 pypi

DESCRIPTION="utilities for modified preorder tree traversal and trees of model instances"
HOMEPAGE="https://github.com/django-mptt/django-mptt"
SRC_URI="$(pypi_sdist_url)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/django-2.2[${PYTHON_USEDEP}]
	dev-python/django-js-asset[${PYTHON_USEDEP}]
"

python_test() {
	"${EPYTHON}" tests/manage.py test -v2 myapp ||
		die "Tests failed with ${EPYTHON}"
}
