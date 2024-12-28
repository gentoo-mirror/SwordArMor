#!/sbin/openrc-run
# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

name="stayrtr daemon"
description="RPKI-To-Router server implementation in Go"
command=/usr/bin/stayrtr
command_args="${STAYRTR_OPTS}"
pidfile="/run/${RC_SVCNAME}.pid"
command_background=true
start_stop_daemon_args="--user ${RC_SVCNAME} --group ${RC_SVCNAME} \
	--stdout /var/log/${RC_SVCNAME}.log \
	--stderr /var/log/${RC_SVCNAME}.log"

depend() {
	use net
	use logger
}

start_pre() {
	checkpath -f -m 0755 -o ${RC_SVCNAME}:${RC_SVCNAME} "/var/log/${RC_SVCNAME}.log"
}
