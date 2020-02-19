# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTITN="User for FORT RPKI validator"
ACCT_USER_ID=323
ACCT_USER_GROUPS=( fort )
ACCT_USER_HOME=/var/lib/${PN}/

acct-user_add_deps
