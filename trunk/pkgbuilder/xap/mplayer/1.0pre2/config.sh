# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/xap/mplayer/1.0pre2/Attic/config.sh,v 1.1 2003/10/21 18:19:54 tomby Exp $

PKG_NAME="mplayer"
PKG_VERSION="1.0pre2"
PKG_ARCH="i486"
PKG_BUILD="am3"
PKG_URL="http://www1.mplayerhq.hu/MPlayer/releases/MPlayer-$PKG_VERSION.tar.bz2"
PKG_FONT_URL="http://www1.mplayerhq.hu/MPlayer/releases/fonts/font-arial-iso-8859-1.tar.bz2"
PKG_SKIN_URL="http://www1.mplayerhq.hu/MPlayer/Skin/Blue-1.0.tar.bz2"

PKG_SRC="$TMP/MPlayer-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="AUTHORS LICENSE README ChangeLog DOCS/en/*.html etc/example.conf"

PKG_PREFIX="/usr"
