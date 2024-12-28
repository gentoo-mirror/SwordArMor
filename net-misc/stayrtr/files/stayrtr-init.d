#!/sbin/openrc-run
# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

name="stayrtr daemon"
description="RPKI-To-Router server implementation in Go"
command=/usr/bin/stayrtr
command_args="${STAYRTR_OPTS}"

depend() {
	use net
	use logger
}
