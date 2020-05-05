# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-group

KEYWORDS="amd64 arm64 x86"

# TCP port 179, but 179 is already used by acct-group/_bgpd
ACCT_GROUP_ID=180
