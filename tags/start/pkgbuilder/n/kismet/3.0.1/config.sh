# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/n/kismet/3.0.1/Attic/config.sh,v 1.1 2003/10/21 18:19:51 tomby Exp $

PKG_NAME="kismet"
PKG_VERSION="3.0.1"
PKG_ETHEREAL_VERSION="0.9.15"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_URL="http://www.kismetwireless.net/code/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_ETHEREAL_URL="http://www.ethereal.com/distribution/all-versions/ethereal-$PKG_ETHEREAL_VERSION.tar.bz2"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_ETHEREAL_SRC="$TMP/$PKG_NAME-$PKG_VERSION/ethereal-$PKG_ETHEREAL_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="CHANGELOG FAQ GPL README TODO docs/DEVEL.* docs/README.*"

PKG_PREFIX="/usr"
