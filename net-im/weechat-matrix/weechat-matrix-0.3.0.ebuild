# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit python-single-r1

DESCRIPTION="Weechat Matrix protocol script written in python"
HOMEPAGE="https://github.com/poljar/weechat-matrix"
SRC_URI="https://github.com/poljar/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
REQUIRED_USE=${PYTHON_REQUIRED_USE}

DEPEND="
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		dev-python/pyopenssl[${PYTHON_USEDEP}]
		dev-python/webcolors[${PYTHON_USEDEP}]
		dev-python/atomicwrites[${PYTHON_USEDEP}]
		dev-python/attrs[${PYTHON_USEDEP}]
		dev-python/logbook[${PYTHON_USEDEP}]
		dev-python/pygments[${PYTHON_USEDEP}]
		dev-python/matrix-nio[${PYTHON_USEDEP},e2e]
		dev-python/aiohttp[${PYTHON_USEDEP}]
		dev-python/python-magic[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
	')
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	python_domodule matrix
	python_scriptinto /usr/lib/weechat/plugins
	python_newexe main.py matrix.py
}
