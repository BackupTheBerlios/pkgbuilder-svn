# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/xap/fluxbox/0.1.14/Attic/config.sh,v 1.1 2003/10/21 18:19:54 tomby Exp $

PKG_NAME="fluxbox"
PKG_VERSION="0.1.14"
PKG_ARCH="i486"
PKG_BUILD="am2"
PKG_URL="http://download.sourceforge.net/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.bz2"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="AUTHORS ChangeLog COPYING INSTALL NEWS README TODO doc/Coding_style"

PKG_PREFIX="/usr/X11R6"
