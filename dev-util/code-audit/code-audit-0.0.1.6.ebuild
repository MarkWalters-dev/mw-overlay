EAPI=8

DESCRIPTION="Zero-dependency dependency auditor"
HOMEPAGE="https://github.com/MarkWalters-dev/code-audit"
SRC_URI="https://github.com/MarkWalters-dev/code-audit/releases/download/v${PV}/depaudit-${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/depaudit-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

BDEPEND="virtual/rust"

src_compile() {
	cargo build --release --frozen || die
}

src_install() {
	dobin target/release/depaudit
}
