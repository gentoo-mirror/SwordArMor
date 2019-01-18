# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit perl-module

DESCRIPTION="This module is a framework for writing Net-SNMP extensions using
the pass or pass_persist mechanisms."
SRC_URI="https://cpan.metacpan.org/authors/id/S/SA/SAPER/${P}.tar.gz"
HOMEPAGE="https://metacpan.org/pod/SNMP::Extension::PassPersist"

LICENSE="perl"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-perl/Module-Build
dev-perl/Class-Accessor
dev-perl/IO-String
dev-perl/Sort-Key-OID"
