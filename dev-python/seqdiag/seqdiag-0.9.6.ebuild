# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )
inherit distutils-r1

DESCRIPTION="seqdiag generate sequence-diagram image file from spec-text file."
HOMEPAGE="http://blockdiag.com/en/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/funcparserlib
dev-python/blockdiag"
RDEPEND="${DEPEND}"
BDEPEND=""
