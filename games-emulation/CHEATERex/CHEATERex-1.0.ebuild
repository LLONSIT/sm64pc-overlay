# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A fork of sm64ex"
HOMEPAGE="https://github.com/s4Ys369/CHEATERex"
SRC_URI="https://github.com/s4Ys369/CHEATERex/archive/refs/heads/nightly.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="media-libs/libsdl2
        media-libs/glew"


S=${WORKDIR}

RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
cp /opt/baserom.us.z64 /var/tmp/portage/games-emulation/CHEATERex-1.0/work/CHEATERex-nightly/
 cd /var/tmp/portage/games-emulation/CHEATERex-1.0/work/CHEATERex-nightly/
 
 if [[ -f Makefile ]] || [[ -f GNUmakefile ]] || [[ -f makefile ]]; then
		emake || die "emake failed"
	fi
}

src_install() {
   rm -rf /tmp/${P} #clean
   mv CHEATERex-nightly/build/us_pc /$HOME/${PN} || die "Installation failed"
}


