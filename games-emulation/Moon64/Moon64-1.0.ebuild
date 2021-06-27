# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="An SM64 for with external addon support"
HOMEPAGE="https://github.com/KiritoDv/Moon64"
SRC_URI="https://github.com/LLONSIT/packages/raw/master/${PN}.tar.xz"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="media-libs/libsdl2
	media-libs/glew"


S=${WORKDIR}

RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
  cp /opt/baserom.us.z64 /var/tmp/portage/games-emulation/Moon64-1.0/work/Moon64-feature-testing/ 
  cd Moon64-feature-testing
 if [[ -f Makefile ]] || [[ -f GNUmakefile ]] || [[ -f makefile ]]; then
		emake || die "emake failed"
	fi
}

src_install() {
  sh install.sh
}
