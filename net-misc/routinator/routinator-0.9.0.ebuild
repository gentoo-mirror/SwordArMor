# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.2.0

EAPI=7

CRATES="
addr2line-0.15.1
adler-1.0.2
ansi_term-0.11.0
arc-swap-1.3.0
arrayref-0.3.6
arrayvec-0.5.2
async-compression-0.3.8
atty-0.2.14
autocfg-1.0.1
backtrace-0.3.59
base64-0.13.0
bcder-0.6.0
bitflags-1.2.1
blake2b_simd-0.5.11
bumpalo-3.6.1
byteorder-1.4.3
bytes-1.0.1
cc-1.0.68
cfg-if-0.1.10
cfg-if-1.0.0
chrono-0.4.19
clap-2.33.3
console_error_panic_hook-0.1.6
constant_time_eq-0.1.5
core-foundation-0.9.1
core-foundation-sys-0.8.2
crc32fast-1.2.1
crossbeam-epoch-0.9.5
crossbeam-queue-0.3.1
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
fs2-0.4.3
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
futures-0.3.15
futures-channel-0.3.15
futures-core-0.3.15
futures-executor-0.3.15
futures-io-0.3.15
futures-macro-0.3.15
futures-sink-0.3.15
futures-task-0.3.15
futures-util-0.3.15
fxhash-0.2.1
getrandom-0.2.3
gimli-0.23.0
gimli-0.24.0
h2-0.3.3
hashbrown-0.9.1
hermit-abi-0.1.18
http-0.2.4
http-body-0.4.2
httparse-1.4.1
httpdate-1.0.1
hyper-0.14.8
hyper-rustls-0.22.1
hyper-tls-0.5.0
idna-0.2.3
indexmap-1.6.2
instant-0.1.9
iovec-0.1.4
ipnet-2.3.0
itoa-0.4.7
js-sys-0.3.51
kernel32-sys-0.2.2
lazy_static-1.4.0
libc-0.2.95
listenfd-0.3.3
lock_api-0.4.4
log-0.4.14
log-reroute-0.1.7
matches-0.1.8
maybe-uninit-2.0.0
memchr-2.4.0
memoffset-0.6.3
mime-0.3.16
mime_guess-2.0.3
miniz_oxide-0.4.4
mio-0.7.11
mio-uds-0.6.8
miow-0.3.7
native-tls-0.2.7
net2-0.2.36
nix-0.20.0
ntapi-0.3.6
num-integer-0.1.44
num-traits-0.2.14
num_cpus-1.13.0
object-0.24.0
once_cell-1.7.2
openssl-0.10.34
openssl-probe-0.1.4
openssl-sys-0.9.63
parking_lot-0.11.1
parking_lot_core-0.8.3
percent-encoding-2.1.0
pest-2.1.3
pin-project-1.0.7
pin-project-internal-1.0.7
pin-project-lite-0.2.6
pin-utils-0.1.0
pkg-config-0.3.19
ppv-lite86-0.2.10
proc-macro-hack-0.5.19
proc-macro-nested-0.1.7
proc-macro2-1.0.27
quick-xml-0.22.0
quote-1.0.9
rand-0.8.3
rand_chacha-0.3.0
rand_core-0.6.2
rand_hc-0.3.0
redox_syscall-0.2.8
redox_users-0.4.0
remove_dir_all-0.5.3
reqwest-0.11.3
ring-0.16.20
rpki-0.11.0
rpki-rtr-0.2.0
rust-argon2-0.8.3
rustc-demangle-0.1.19
rustc_version-0.3.3
rustls-0.19.1
ryu-1.0.5
schannel-0.1.19
scoped-tls-1.0.0
scopeguard-1.1.0
sct-0.6.1
security-framework-2.2.0
security-framework-sys-2.2.0
semver-0.11.0
semver-parser-0.10.2
serde-1.0.126
serde_derive-1.0.126
serde_json-1.0.64
serde_urlencoded-0.7.0
signal-hook-registry-1.3.0
slab-0.4.3
sled-0.34.6
smallvec-1.6.1
socket2-0.4.0
spin-0.5.2
strsim-0.8.0
syn-1.0.72
syslog-5.0.0
tempfile-3.2.0
textwrap-0.11.0
thiserror-1.0.25
thiserror-impl-1.0.25
time-0.1.43
time-0.1.44
tinyvec-1.2.0
tinyvec_macros-0.1.0
tokio-1.6.1
tokio-macros-1.2.0
tokio-native-tls-0.3.0
tokio-rustls-0.22.0
tokio-socks-0.5.1
tokio-stream-0.1.6
tokio-tls-0.3.1
tokio-util-0.6.7
toml-0.5.8
tower-service-0.3.1
tracing-0.1.26
tracing-core-0.1.18
tracing-futures-0.2.4
try-lock-0.2.3
ucd-trie-0.1.3
unicase-2.6.0
unicode-bidi-0.3.5
unicode-normalization-0.1.17
unicode-width-0.1.8
unicode-xid-0.2.2
untrusted-0.7.1
unwrap-1.2.1
url-2.2.2
uuid-0.8.2
vcpkg-0.2.13
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
wasm-bindgen-test-0.3.19
wasm-bindgen-test-macro-0.3.19
web-sys-0.3.51
webpki-0.21.4
webpki-roots-0.21.1
winapi-0.2.8
winapi-0.3.9
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
winreg-0.7.0
ws2_32-sys-0.2.1
"

inherit cargo

MY_PV=${PV/_/-}

DESCRIPTION="An RPKI relying party software"
HOMEPAGE="https://github.com/NLnetLabs/routinator"
MY_GITHUB_AUTHOR="NLnetLabs"
SRC_URI="$(cargo_crate_uris ${CRATES})
https://github.com/${MY_GITHUB_AUTHOR}/${PN}/archive/refs/tags/${MY_PV}.tar.gz -> ${P}.tar.gz"
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
