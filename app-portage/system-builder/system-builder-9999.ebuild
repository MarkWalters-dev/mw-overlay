# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES=""

inherit cargo git-r3 systemd

DESCRIPTION="Build Gentoo systems one at a time, with queueing and live emerge streaming"
HOMEPAGE="https://github.com/MarkWalters-dev/system-builder"
EGIT_REPO_URI="https://github.com/MarkWalters-dev/system-builder.git"

LICENSE="MIT"
SLOT="0"
IUSE="+server"

RDEPEND="server? ( sys-apps/systemd sys-apps/util-linux )"
BDEPEND="virtual/rust"

src_compile() {
	# The client always builds; the server only with USE=server, so
	# client-only machines skip compiling its dependencies.
	local packages=( -p gb-client )
	use server && packages+=( -p gb-server )
	cargo_src_compile "${packages[@]}"
}

src_install() {
	dobin target/release/gb-client
	if use server; then
		dobin target/release/gb-server
		systemd_dounit packaging/system-builder.service
		insinto /etc/system-builder
		newins config.example.toml config.toml
	fi
	dodoc README.md
}
