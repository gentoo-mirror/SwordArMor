# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.2.0

EAPI=7

CRATES="
	addr2line-0.15.2
	adler-1.0.2
	ansi_term-0.11.0
	arc-swap-1.3.0
	async-compression-0.3.8
	atty-0.2.14
	autocfg-1.0.1
	backtrace-0.3.60
	base64-0.13.0
	bcder-0.6.0
	bitflags-1.2.1
	bumpalo-3.7.0
	bytes-1.0.1
	cc-1.0.69
	cfg-if-1.0.0
	chrono-0.4.19
	clap-2.33.3
	core-foundation-0.9.1
	core-foundation-sys-0.8.2
	crc32fast-1.2.1
	crossbeam-queue-0.3.2
	crossbeam-utils-0.8.5
	dirs-3.0.2
	dirs-sys-0.3.6
	either-1.6.1
	encoding_rs-0.8.28
	error-chain-0.12.4
	fern-0.6.0
	flate2-1.0.20
	fnv-1.0.7
	foreign-types-0.3.2
	foreign-types-shared-0.1.1
	form_urlencoded-1.0.1
	futures-0.3.15
	futures-channel-0.3.15
	futures-core-0.3.15
	futures-executor-0.3.15
	futures-io-0.3.15
	futures-macro-0.3.15
	futures-sink-0.3.15
	futures-task-0.3.15
	futures-util-0.3.15
	getrandom-0.2.3
	gimli-0.24.0
	h2-0.3.3
	hashbrown-0.11.2
	hermit-abi-0.1.19
	http-0.2.4
	http-body-0.4.2
	httparse-1.4.1
	httpdate-1.0.1
	hyper-0.14.11
	hyper-rustls-0.22.1
	hyper-tls-0.5.0
	idna-0.2.3
	indexmap-1.7.0
	ipnet-2.3.1
	itoa-0.4.7
	js-sys-0.3.51
	lazy_static-1.4.0
	libc-0.2.98
	log-0.4.14
	log-reroute-0.1.7
	matches-0.1.8
	memchr-2.4.0
	memoffset-0.6.4
	mime-0.3.16
	miniz_oxide-0.4.4
	mio-0.7.13
	miow-0.3.7
	native-tls-0.2.7
	nix-0.22.0
	ntapi-0.3.6
	num-integer-0.1.44
	num-traits-0.2.14
	num_cpus-1.13.0
	object-0.25.3
	once_cell-1.8.0
	openssl-0.10.35
	openssl-probe-0.1.4
	openssl-sys-0.9.65
	percent-encoding-2.1.0
	pin-project-lite-0.2.7
	pin-utils-0.1.0
	pkg-config-0.3.19
	ppv-lite86-0.2.10
	proc-macro-hack-0.5.19
	proc-macro-nested-0.1.7
	proc-macro2-1.0.28
	quick-xml-0.22.0
	quote-1.0.9
	rand-0.8.4
	rand_chacha-0.3.1
	rand_core-0.6.3
	rand_hc-0.3.1
	redox_syscall-0.2.9
	redox_users-0.4.0
	remove_dir_all-0.5.3
	reqwest-0.11.4
	ring-0.16.20
	rpki-0.12.2
	rustc-demangle-0.1.20
	rustc_version-0.4.0
	rustls-0.19.1
	ryu-1.0.5
	schannel-0.1.19
	sct-0.6.1
	security-framework-2.3.1
	security-framework-sys-2.3.0
	semver-1.0.3
	serde-1.0.126
	serde_derive-1.0.126
	serde_json-1.0.64
	serde_urlencoded-0.7.0
	signal-hook-registry-1.4.0
	slab-0.4.3
	smallvec-1.6.1
	socket2-0.4.0
	spin-0.5.2
	strsim-0.8.0
	syn-1.0.74
	syslog-5.0.0
	tempfile-3.2.0
	term_size-0.3.2
	term_size-0.3.2
	textwrap-0.11.0
	thiserror-1.0.26
	thiserror-impl-1.0.26
	time-0.1.43
	tinyvec-1.3.1
	tinyvec_macros-0.1.0
	tokio-1.9.0
	tokio-macros-1.3.0
	tokio-native-tls-0.3.0
	tokio-rustls-0.22.0
	tokio-socks-0.5.1
	tokio-stream-0.1.7
	tokio-util-0.6.7
	toml-0.5.8
	tower-service-0.3.1
	tracing-0.1.26
	tracing-core-0.1.18
	try-lock-0.2.3
	unicode-bidi-0.3.5
	unicode-normalization-0.1.19
	unicode-width-0.1.8
	unicode-xid-0.2.2
	untrusted-0.7.1
	url-2.2.2
	uuid-0.8.2
	vcpkg-0.2.15
	vec_map-0.8.2
	version_check-0.9.3
	want-0.3.0
	wasi-0.10.2+wasi-snapshot-preview1
	wasm-bindgen-0.2.74
	wasm-bindgen-backend-0.2.74
	wasm-bindgen-futures-0.4.24
	wasm-bindgen-macro-0.2.74
	wasm-bindgen-macro-support-0.2.74
	wasm-bindgen-shared-0.2.74
	web-sys-0.3.51
	webpki-0.21.4
	webpki-roots-0.21.1
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-x86_64-pc-windows-gnu-0.4.0
	winreg-0.7.0
"

inherit cargo

MY_PV=${PV/_/-}

DESCRIPTION="An RPKI relying party software"
HOMEPAGE="https://github.com/NLnetLabs/routinator"
MY_GITHUB_AUTHOR="NLnetLabs"
SRC_URI="$(cargo_crate_uris ${CRATES})
https://github.com/${MY_GITHUB_AUTHOR}/${PN}/archive/refs/tags/v${MY_PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="rta"

S="${WORKDIR}/${PN}-${MY_PV}"

DEPEND="
	acct-group/routinator
	acct-user/routinator
	>=virtual/rust-1.42.0
"
RDEPEND="${DEPEND}"

src_configure() {
	local myfeatures=(
		$(usev rta)
	)

	cargo_src_configure
}

src_install() {
	newinitd "${FILESDIR}/${PN}-initd" ${PN}
	newconfd "${FILESDIR}/${PN}-confd" ${PN}

	cargo_src_install
}

pkg_postinst() {
	einfo ""
	einfo "ARIN TAL is disabled by default because the ARIN Relying Party"
	einfo "Agreement must be accepted beforehead. Read"
	einfo "https://www.arin.net/resources/manage/rpki/rpa.pdf and if you agree"
	einfo "with it, run"
	einfo ""
	einfo "  su -s /bin/sh -c '${EROOT}/usr/bin/routinator --base-dir=/var/lib/routinator init -f --accept-arin-rpa' routinator"
	einfo ""
	einfo "as root to enable it."
	einfo "If you changed values in /etc/conf.d/routinator please update it"
	einfo "accordinadly in the command line."
	einfo ""

	# https://github.com/NLnetLabs/routinator/pull/510
	# https://github.com/NLnetLabs/routinator/pull/543
	if [ "${PV}" = "0.9.0" ]; then
		su -l routinator -s /bin/sh -c \
			"${EROOT}/usr/bin/routinator --base-dir=/var/lib/routinator init"
	fi
}
