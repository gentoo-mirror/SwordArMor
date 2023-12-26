# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Shared C library to include Cisco-like CLI into other software"
HOMEPAGE="https://dparrish.com/pages/libcli"
SRC_URI="https://github.com/dparrish/${PN}/archive/V${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="virtual/libcrypt"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/${PN}-Makefile.patch"
)
