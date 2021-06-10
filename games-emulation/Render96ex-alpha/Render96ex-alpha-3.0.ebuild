# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
DESCRIPTION="Fork of sm64-port"
HOMEPAGE="https://github.com/Render96/Render96ex"
SRC_URI="https://github.com/Render96/Render96ex/archive/refs/heads/alpha.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S=${WORKDIR}

DEPEND="media-libs/libsdl2
        media-libs/glew"

RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
  cp /tmp/baserom.us.z64 /var/tmp/portage/games-emulation/Render96ex-alpha-3.0/work/Render96ex-alpha
  cd  /var/tmp/portage/games-emulation/Render96ex-alpha-3.0/work/Render96ex-alpha
  if [[ -f Makefile ]] || [[ -f GNUmakefile ]] || [[ -f makefile ]]; then
		emake || die "emake failed"
	fi
}

src_install() {
rm -rf /$HOME/${PN} 
mv Render96ex-alpha/build/us_pc /opt/${PN}
}

pkg_postinst() {
 elog "Your build will be in /op"
}
