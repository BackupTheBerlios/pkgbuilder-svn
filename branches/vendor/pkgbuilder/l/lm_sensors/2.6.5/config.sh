# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/l/lm_sensors/2.6.5/Attic/config.sh,v 1.1 2003/10/21 18:19:49 tomby Exp $

PKG_NAME="lm_sensors"
PKG_VERSION="2.6.5"
PKG_ARCH="i486"
PKG_BUILD="am2"
PKG_URL="http://secure.netroedge.com/~lm78/archive/$PKG_NAME-$PKG_VERSION.tar.gz"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="B* C* INSTALL lm_sensors.lsm QUICKSTART README* TODO doc/FAQ"

PKG_PREFIX="/usr"
