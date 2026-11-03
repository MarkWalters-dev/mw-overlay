EAPI=8

inherit cargo

DESCRIPTION="Custom multi-language CLI code auditor"
HOMEPAGE="https://github.com/MarkWalters-dev/code-audit"
SRC_URI="https://github.com/MarkWalters-dev/code-audit/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/code-audit-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

src_unpack() {
    default
    cargo_src_unpack
}

src_install() {
    cargo_src_install
}
