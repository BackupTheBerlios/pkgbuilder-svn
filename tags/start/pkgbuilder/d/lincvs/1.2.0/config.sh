# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/d/lincvs/1.2.0/Attic/config.sh,v 1.1 2003/10/21 18:19:47 tomby Exp $

PKG_NAME="lincvs"
PKG_VERSION="1.2.0"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_URL="http://ppprs1.phy.tu-dresden.de/~trogisch/lincvs/download/LinCVS/$PKG_NAME-$PKG_VERSION/$PKG_NAME-$PKG_VERSION-0-generic-src.tgz"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="AUTHORS BUGS.txt ChangeLog COPYING FAQ.txt INSTALL* \
    LICENSE NEWS PROXY-HOWTO.txt README* SSH-HOWTO.txt THANKS todo.txt VERSION"

PKG_QTDIR="`whereis qt | cut -d ' ' -f 2`"
