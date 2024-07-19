# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
inherit git-r3 python-r1

DESCRIPTION="Check for a domain expiration using RDAP"
HOMEPAGE="https://git.grifon.fr/alarig/nagios-check_domain_expiration_rdap"
EGIT_REPO_URI="https://git.grifon.fr/alarig/${PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	dev-python/nagiosplugin[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/pyunycode[${PYTHON_USEDEP}]
	dev-python/requests-cache[${PYTHON_USEDEP}]
"
RDEPEND="${PYTHON_DEPS}"

src_prepare() {
	mv "${PN/nagios-/}".py "${PN/nagios-/}"
	default
}

src_install() {
	python_scriptinto /usr/$(get_libdir)/nagios/plugins/
	python_foreach_impl python_doscript "${PN/nagios-/}"

	dodoc README.md
}
