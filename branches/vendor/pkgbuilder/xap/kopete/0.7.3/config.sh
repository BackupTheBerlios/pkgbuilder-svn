# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/xap/kopete/0.7.3/Attic/config.sh,v 1.1 2003/10/21 18:19:55 tomby Exp $

PKG_NAME="kopete"
PKG_VERSION="0.7.3"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_URL="http://download.sourceforge.net/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.bz2"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="kopete/AUTHORS kopete/C* kopete/INSTALL kopete/NEWS kopete/R* kopete/TODO kopete/VERSION kopete/*.txt"

PKG_PREFIX="/opt/kde"
