# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/l/smpeg/0.4.4/Attic/config.sh,v 1.1 2003/10/21 18:19:48 tomby Exp $

PKG_NAME="smpeg"
PKG_VERSION="0.4.4"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_URL="ftp://sunsite.dk/pub/os/linux/loki/open-source/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="CHANGES COPYING README* TODO"

PKG_PREFIX="/usr"
