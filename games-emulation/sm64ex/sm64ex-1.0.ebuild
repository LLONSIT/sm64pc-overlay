# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A fork of sm64-port"
HOMEPAGE="https://github.com/sm64pc/sm64ex"
SRC_URI="https://github.com/sm64pc/sm64ex/archive/refs/heads/master.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="media-libs/libsdl2
        media-libs/glew"

S=${WORKDIR} 

RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
   cp /opt/baserom.us.z64 sm64ex-master
   cd sm64ex-master
   if [[ -f Makefile ]] || [[ -f GNUmakefile ]] || [[ -f makefile ]]; then
		emake || die "emake failed"
	fi
}
 

src_install() {
 mv sm64ex-master/build/us_pc /builds/${PN}
}
