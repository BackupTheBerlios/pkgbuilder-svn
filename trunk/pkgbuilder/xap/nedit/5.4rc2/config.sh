# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/xap/nedit/5.4rc2/Attic/config.sh,v 1.1 2003/10/25 15:34:50 tomby Exp $

PKG_NAME="nedit"
PKG_VERSION="5.4rc2"
PKG_ARCH="i486"
PKG_BUILD="am1"
PKG_EXTENSION="tar.bz2"
PKG_FILE_NAME="$PKG_NAME-5.4RC2.tar.bz2"
PKG_URL="ftp://ftp.nedit.org/pub/beta/$PKG_FILE_NAME"

PKG_HOMESITE="www.nedit.org"

PKG_SRC="$TMP/$PKG_NAME-5.4RC2"
PKG_DEST="$TMP/$PKG_NAME-$PKG_VERSION-pkg"
PKG_DOC="$PKG_DEST/usr/doc/$PKG_NAME-$PKG_VERSION"
PKG_DOC_FILES="README ReleaseNotes ChangeLog COPYRIGHT
    doc/*.txt doc/nedit.doc doc/README.FAQ doc/NEdit.ad"
    
PKG_PREFIX="/usr"
