# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="User for app-metrics/frr_exporter"
ACCT_USER_ID=-1
ACCT_USER_GROUPS=( frr_exporter )
ACCT_USER_SHELL=/bin/sh

acct-user_add_deps
