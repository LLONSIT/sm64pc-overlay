# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="For of sm64ex-alo Star Road RM2C"
HOMEPAGE="https://github.com/s4Ys369/sm64ex-alo"
SRC_URI="https://github.com/s4Ys369/sm64ex-alo/archive/refs/heads/star_road.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="media-libs/libsdl2
       media-libs/glew"

S=${WORKDIR}

RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
cp /tmp/baserom.us.z64 /var/tmp/portage/games-emulation/sm64ex-alo-star_road-1.0/work/sm64ex-alo-star_road
cd sm64ex-alo-star_road
if [[ -f Makefile ]] || [[ -f GNUmakefile ]] || [[ -f makefile ]]; then
		emake  TARGET_N64=0 TARGET_ARCH=native  TARGET_GAME_CONSOLE=0 DEBUG=1 RM2C=1 || die "emake failed"
	fi
}

src_install() {
rm -rf /builds/${PN}
mv sm64ex-alo-star_road/build/us_pc /builds/${PN}
}

pkg_postinst() {
elog "Your build will be on /opt"
}
