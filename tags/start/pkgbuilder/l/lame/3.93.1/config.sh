# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/l/lame/3.93.1/Attic/config.sh,v 1.1 2003/10/21 18:19:47 tomby Exp $

PKG_NAME="lame"
PKG_VERSION="3.93.1"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_URL="http://download.sourceforge.net/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="API COPYING HACKING PRESETS.draft LICENSE README* TODO USAGE"

PKG_PREFIX="/usr"
