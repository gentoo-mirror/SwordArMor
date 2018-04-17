# Copyright 2016 Alarig Le Lay
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI=5
MY_P=${PN/-mod/}
DESCRIPTION="Quotes from Jasper Fforde books"
HOMEPAGE="https://www.swordarmor.fr/"
SRC_URI="https://www.swordarmor.fr/documents/${MY_P}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~x86-solaris"
IUSE=""
RESTRICT="mirror"

RDEPEND="games-misc/fortune-mod"

S=${WORKDIR}/${MY_P}

src_install() {
	insinto /usr/share/fortune
	doins fforde fforde.dat
}
