# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..9} )
inherit distutils-r1

DESCRIPTION="Custom FILE_STORAGE for Django"
HOMEPAGE="https://pypi.org/project/django-db-file-storage/
https://github.com/victor-o-silva/"
SRC_URI="mirror://pypi/${PN:0:1}"/${PN}/${P}.tar.gz

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-python/django[${PYTHON_USEDEP}]
"

RDEPEND="${DEPEND}"
