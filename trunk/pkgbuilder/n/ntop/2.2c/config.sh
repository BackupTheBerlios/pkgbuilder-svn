# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/n/ntop/2.2c/Attic/config.sh,v 1.2 2003/11/01 12:09:59 tomby Exp $

PKG_NAME="ntop"
PKG_VERSION="2.2c"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_EXTENSION="tgz"
PKG_FILE_NAME="$PKG_NAME-$PKG_VERSION.$PKG_EXTENSION"
PKG_URL="http://download.sourceforge.net/$PKG_NAME/$PKG_FILE_NAME"

PKG_HOMEPAGE="http://www.ntop.org"

PKG_SRC="$TMP/$PKG_NAME"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="AUTHORS CONTENTS COPYING ChangeLog MANIFESTO NEWS
               PORTING README SUPPORT_NTOP.txt THANKS docs/* ntop.html"

PKG_PREFIX="/usr"
