# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{11..12} )
inherit distutils-r1 pypi

DESCRIPTION="Django project that contains default and url settings for Mailman3 Web Interface"
HOMEPAGE="https://pypi.org/project/mailman-web/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="mysql"

RDEPEND="
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		>=dev-python/django-4.0[${PYTHON_USEDEP}]
		<dev-python/django-4.3
		dev-python/psycopg:2[${PYTHON_USEDEP}]
		dev-python/whoosh[${PYTHON_USEDEP}]
		net-mail/HyperKitty[${PYTHON_USEDEP}]
		net-mail/postorius[${PYTHON_USEDEP}]
		www-servers/gunicorn[${PYTHON_USEDEP}]
	')
"

src_install() {
	distutils-r1_src_install
	newinitd "${FILESDIR}"/${PN}.initd ${PN}
	sed -i "/gunicorn/ s|%python%|${EPYTHON}|" "${D}"/etc/init.d/${PN} || \
		die "Setting python interpreter in init script failed"
}
