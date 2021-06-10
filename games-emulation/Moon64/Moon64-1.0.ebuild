# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="for of sm64ex"
HOMEPAGE="https://github.com/KiritoDv/Moon64"
SRC_URI="https://github.com/LLONSIT/sdas/raw/main/${PN}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="media-libs/libsdl2
	media-libs/glew"


S=${WORKDIR}

RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
  cp /opt/baserom.us.z64 /var/tmp/portage/games-emulation/Moon64-1.0/work/Moon64-master/ 
  cd Moon64-master 
 if [[ -f Makefile ]] || [[ -f GNUmakefile ]] || [[ -f makefile ]]; then
		emake || die "emake failed"
	fi
}

src_install() {
   mkdir /builds
   rm -rf /builds/${PN}
   mv Moon64-master/build/us_pc /builds/${PN}
}
