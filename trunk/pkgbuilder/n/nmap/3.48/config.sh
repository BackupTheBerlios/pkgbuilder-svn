# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/n/nmap/3.48/Attic/config.sh,v 1.1 2003/10/21 18:19:50 tomby Exp $

PKG_NAME="nmap"
PKG_VERSION="3.48"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_URL="http://download.insecure.org/$PKG_NAME/dist/$PKG_NAME-$PKG_VERSION.tar.bz2"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="CHANGELOG COPYING HACKING INSTALL docs/README docs/*.txt"

PKG_PREFIX="/usr"
