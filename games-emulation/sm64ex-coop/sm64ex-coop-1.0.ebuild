# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="for of sm64ex with additional features."
HOMEPAGE="https://github.com/djoslin0/sm64ex-coop"
SRC_URI="https://github.com/djoslin0/sm64ex-coop/archive/refs/heads/coop.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="media-libs/libsdl2
        media-libs/glew
        net-im/discord-bin"

S=${WORKDIR}

RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
cp /tmp/baserom.us.z64 /var/tmp/portage/games-emulation/sm64ex-coop-1.0/work/sm64ex-coop-coop
cd /var/tmp/portage/games-emulation/sm64ex-coop-1.0/work/sm64ex-coop-coop 
if [[ -f Makefile ]] || [[ -f GNUmakefile ]] || [[ -f makefile ]]; then
		emake || die "emake failed"
	fi
}

src_install() {
rm /builds/${PN}
mv sm64ex-coop-coop/build/us_pc /builds/${PN}
}

pkg_postinst() {
 elog "the build will be on /opt"
}
