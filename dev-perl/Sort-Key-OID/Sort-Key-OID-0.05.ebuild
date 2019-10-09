# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit perl-module

DESCRIPTION="This module extends the Sort::Key family of modules to support
sorting of OID values."
SRC_URI="https://cpan.metacpan.org/authors/id/S/SA/SALVA/${P}.tar.gz"
HOMEPAGE="https://metacpan.org/pod/Sort::Key::OID"

LICENSE="|| ( Artistic GPL-1+ )" # same as perl
SLOT="0"
KEYWORDS="~amd64 ~x86"
