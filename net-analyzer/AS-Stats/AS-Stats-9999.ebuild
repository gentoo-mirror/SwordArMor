# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 webapp

DESCRIPTION="A simple tool to generate per-AS traffic graphs from NetFlow/sFlow records"
HOMEPAGE="https://github.com/manuelkasper/AS-Stats"
EGIT_REPO_URI="https://github.com/manuelkasper/AS-Stats.git"

LICENSE="BSD-2"
KEYWORDS=""
IUSE="+as-stat-gui +ip2as"

DEPEND="
	as-stat-gui? ( www-misc/as-stats-gui )
	dev-lang/php:*[sqlite]
	dev-perl/DBD-SQLite
	dev-perl/File-Find-Rule
	dev-perl/JSON-XS
	dev-perl/Net-Patricia
	dev-perl/Net-sFlow
	ip2as? ( dev-perl/ip2as )
	net-analyzer/rrdtool[perl]
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	webapp_src_preinst

	dodoc README.md
	rm -f README.md

	insinto "${MY_HTDOCSDIR}/"
	doins -r .

	use as-stat-gui && \
		rm -rf www && \
		ln -s "${PREFIX}"/usr/share/as-stat-gui www

	webapp_src_install
}