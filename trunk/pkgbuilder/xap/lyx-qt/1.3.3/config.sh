# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/xap/lyx-qt/1.3.3/Attic/config.sh,v 1.1 2003/10/21 18:19:55 tomby Exp $

PKG_NAME="lyx"
PKG_VERSION="1.3.3"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_URL="ftp://ftp.lyx.org/pub/lyx/stable/$PKG_NAME-$PKG_VERSION.tar.bz2"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="ABOUT-NLS ANNOUNCE ChangeLog COPYING INSTALL* NEWS README* UPGRADING"

PKG_PREFIX="/usr"
PKG_QTDIR=`whereis qt | cut -d " " -f 2`
