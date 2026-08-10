# This file is rendered by the release workflow. Do not publish it directly;
# the gentoo-overlay repository receives the rendered ebuild and Manifest.
# Copyright 2024-2026 gitkeniwo
# Distributed under the terms of the MIT license

EAPI=8

DESCRIPTION="Filesystem-native snippet library and agent-friendly CLI (prebuilt)"
HOMEPAGE="https://github.com/gitkeniwo/snip"
SRC_URI="
	amd64? (
		https://github.com/gitkeniwo/snip/releases/download/v${PV}/snip-x86_64-unknown-linux-musl.tar.gz
			-> snip-${PV}-amd64.tar.gz
	)
	arm64? (
		https://github.com/gitkeniwo/snip/releases/download/v${PV}/snip-aarch64-unknown-linux-musl.tar.gz
			-> snip-${PV}-arm64.tar.gz
	)
"

S="${WORKDIR}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="-* ~amd64 ~arm64"

# Static musl release binary; do not strip or expect user CFLAGS to apply.
QA_PREBUILT="usr/bin/snip"
QA_PRESTRIPPED="usr/bin/snip"

src_test() {
	./snip --version || die
}

src_install() {
	dobin snip
	doman man/*.1
	dodoc LICENSE README.md
}
