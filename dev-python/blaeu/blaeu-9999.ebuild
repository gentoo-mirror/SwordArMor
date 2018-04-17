# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6} )
inherit distutils-r1 git-r3

DESCRIPTION="Blaeu, creating measurements on RIPE Atlas probes"
HOMEPAGE="https://framagit.org/bortzmeyer/blaeu"
EGIT_REPO_URI="https://framagit.org/bortzmeyer/blaeu.git"

LICENSE="BSD 2-clause Simplified License"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-python/pyopenssl[${PYTHON_USEDEP}]
		dev-python/cymruwhois[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
