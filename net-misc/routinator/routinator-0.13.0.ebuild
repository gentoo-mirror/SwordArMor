# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.4-r1

EAPI=8

CRATES="
	addr2line@0.21.0
	adler@1.0.2
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anstream@0.5.0
	anstyle@1.0.3
	anstyle-parse@0.2.1
	anstyle-query@1.0.0
	anstyle-wincon@2.1.0
	arbitrary@1.3.0
	autocfg@1.1.0
	backtrace@0.3.69
	base64@0.21.4
	bcder@0.7.3
	bitflags@1.3.2
	bitflags@2.4.0
	bumpalo@3.13.0
	bytes@1.5.0
	cc@1.0.83
	cfg-if@1.0.0
	chrono@0.4.30
	clap@4.4.3
	clap_builder@4.4.2
	clap_derive@4.4.2
	clap_lex@0.5.1
	colorchoice@1.0.0
	core-foundation@0.9.3
	core-foundation-sys@0.8.4
	crc32fast@1.3.2
	crossbeam-queue@0.3.8
	crossbeam-utils@0.8.16
	deranged@0.3.8
	derive_arbitrary@1.3.1
	dirs@5.0.1
	dirs-sys@0.4.1
	either@1.9.0
	encoding_rs@0.8.33
	equivalent@1.0.1
	errno@0.3.3
	errno-dragonfly@0.1.2
	error-chain@0.12.4
	fastrand@2.0.0
	filetime@0.2.22
	flate2@1.0.27
	fnv@1.0.7
	foreign-types@0.3.2
	foreign-types-shared@0.1.1
	form_urlencoded@1.2.0
	futures@0.3.28
	futures-channel@0.3.28
	futures-core@0.3.28
	futures-executor@0.3.28
	futures-io@0.3.28
	futures-macro@0.3.28
	futures-sink@0.3.28
	futures-task@0.3.28
	futures-util@0.3.28
	getrandom@0.2.10
	gimli@0.28.0
	h2@0.3.21
	hashbrown@0.12.3
	hashbrown@0.14.0
	heck@0.4.1
	hermit-abi@0.3.2
	hostname@0.3.1
	http@0.2.9
	http-body@0.4.5
	httparse@1.8.0
	httpdate@1.0.3
	hyper@0.14.27
	hyper-rustls@0.24.1
	hyper-tls@0.5.0
	iana-time-zone@0.1.57
	iana-time-zone-haiku@0.1.2
	idna@0.4.0
	indexmap@1.9.3
	indexmap@2.0.0
	io-lifetimes@1.0.11
	ipnet@2.8.0
	itoa@1.0.9
	js-sys@0.3.64
	lazy_static@1.4.0
	libc@0.2.148
	linux-raw-sys@0.3.8
	linux-raw-sys@0.4.7
	listenfd@1.0.1
	log@0.4.20
	match_cfg@0.1.0
	memchr@2.6.3
	memoffset@0.9.0
	mime@0.3.17
	miniz_oxide@0.7.1
	mio@0.8.8
	native-tls@0.2.11
	nix@0.27.1
	num-traits@0.2.16
	num_cpus@1.16.0
	num_threads@0.1.6
	object@0.32.1
	once_cell@1.18.0
	openssl@0.10.57
	openssl-macros@0.1.1
	openssl-probe@0.1.5
	openssl-sys@0.9.93
	option-ext@0.2.0
	percent-encoding@2.3.0
	pin-project-lite@0.2.13
	pin-utils@0.1.0
	pkg-config@0.3.27
	ppv-lite86@0.2.17
	proc-macro2@1.0.66
	quick-xml@0.29.0
	quote@1.0.33
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	redox_syscall@0.2.16
	redox_syscall@0.3.5
	redox_users@0.4.3
	reqwest@0.11.20
	ring@0.16.20
	routinator-ui@0.3.4
	rpki@0.17.2
	rustc-demangle@0.1.23
	rustix@0.37.23
	rustix@0.38.13
	rustls@0.21.7
	rustls-pemfile@1.0.3
	rustls-webpki@0.101.5
	ryu@1.0.15
	schannel@0.1.22
	sct@0.7.0
	security-framework@2.9.2
	security-framework-sys@2.9.1
	serde@1.0.188
	serde_derive@1.0.188
	serde_json@1.0.106
	serde_urlencoded@0.7.1
	signal-hook-registry@1.4.1
	slab@0.4.9
	smallvec@1.11.0
	socket2@0.4.9
	socket2@0.5.4
	spin@0.5.2
	strsim@0.10.0
	syn@2.0.32
	syslog@6.1.0
	tar@0.4.40
	tempfile@3.8.0
	terminal_size@0.2.6
	thiserror@1.0.48
	thiserror-impl@1.0.48
	time@0.3.28
	time-core@0.1.1
	time-macros@0.2.14
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tokio@1.32.0
	tokio-macros@2.1.0
	tokio-native-tls@0.3.1
	tokio-rustls@0.24.1
	tokio-socks@0.5.1
	tokio-stream@0.1.14
	tokio-util@0.7.8
	toml_datetime@0.6.3
	toml_edit@0.20.0
	tower-service@0.3.2
	tracing@0.1.37
	tracing-core@0.1.31
	try-lock@0.2.4
	unicode-bidi@0.3.13
	unicode-ident@1.0.12
	unicode-normalization@0.1.22
	untrusted@0.7.1
	url@2.4.1
	utf8parse@0.2.1
	uuid@1.4.1
	vcpkg@0.2.15
	version_check@0.9.4
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen@0.2.87
	wasm-bindgen-backend@0.2.87
	wasm-bindgen-futures@0.4.37
	wasm-bindgen-macro@0.2.87
	wasm-bindgen-macro-support@0.2.87
	wasm-bindgen-shared@0.2.87
	web-sys@0.3.64
	webpki-roots@0.25.2
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows@0.48.0
	windows-sys@0.48.0
	windows-targets@0.48.5
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_msvc@0.48.5
	windows_i686_gnu@0.48.5
	windows_i686_msvc@0.48.5
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_msvc@0.48.5
	winnow@0.5.15
	winreg@0.50.0
	xattr@1.0.1
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
	>=virtual/rust-1.70.0
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

# rust does not use *FLAGS from make.conf, silence portage warning
# update with proper path to binaries this crate installs, omit leading /
QA_FLAGS_IGNORED="usr/bin/${PN}"
