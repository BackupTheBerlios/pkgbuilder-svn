# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/xap/gkrellm/2.1.19/Attic/config.sh,v 1.1 2003/10/21 18:19:55 tomby Exp $

PKG_NAME="gkrellm"
PKG_VERSION="2.1.19"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_URL="http://web.wt.net/~billw/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.bz2"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="C* INSTALL README Themes.html"

PKG_PREFIX="/usr"
