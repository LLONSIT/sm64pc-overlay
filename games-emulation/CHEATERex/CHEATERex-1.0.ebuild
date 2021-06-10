# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A for of sm64ex-port"
HOMEPAGE="https://github.com/s4Ys369/CHEATERex"
SRC_URI="https://github.com/s4Ys369/CHEATERex/archive/refs/heads/nightly.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S=${WORKDIR}

DEPEND="media-libs/libsdl2
       media-libs/glew"

RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
 cp /opt/baserom.us.z64 /var/tmp/portage/games-emulation/CHATERex-1.0/CHEATERex-nightly 
 cd CHEATERex-nightly
 if [[ -f Makefile ]] || [[ -f GNUmakefile ]] || [[ -f makefile ]]; then
		emake || die "emake failed"
	fi
}

src_install() {
  mv CHEATERex-nightly/build/us_pc /builds/${PN}
}
