# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/xap/nedit/5.3/Attic/config.sh,v 1.1 2003/10/21 18:19:53 tomby Exp $

PKG_NAME="nedit"
PKG_VERSION="5.3"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_URL="ftp://ftp.nedit.org/pub/v5_3/$PKG_NAME-$PKG_VERSION-source.tar.bz2"

PKG_SRC="$TMP/$PKG_NAME-$PKG_VERSION"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="README ReleaseNotes ChangeLog COPYRIGHT \
    doc/*.txt doc/nedit.doc doc/README.FAQ doc/NEdit.ad"
    
PKG_PREFIX=/usr
