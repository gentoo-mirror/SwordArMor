# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )
inherit python-single-r1 git-r3

DESCRIPTION="This is a looking glass for the Internet Routing Daemon BIRD"
HOMEPAGE="https://github.com/sileht/bird-lg"
EGIT_REPO_URI="https://git.grifon.fr/alarig/${PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND=">=dev-python/flask-0.8
		dev-python/dnspython
		dev-python/pydot
		dev-python/python-memcached
		media-gfx/graphviz
		net-misc/whois
		net-analyzer/traceroute"
RDEPEND="${DEPEND}"

src_install() {
	insinto /opt/${PN}
	doins *.py *.cfg lg.wsgi
	doins -r static templates

	exeinto /opt/${PN}
	doexe lg.py
}
