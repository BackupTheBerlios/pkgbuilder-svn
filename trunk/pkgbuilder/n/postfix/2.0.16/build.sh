# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/n/postfix/2.0.16/Attic/build.sh,v 1.2 2003/10/22 22:03:22 tomby Exp $
#
# postfix pkgbuilder script
#

include do_info

include do_build

include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_fetch() {
    cd $TMP
    
    fetch $PKG_URL && 
    fetch $PKG_URL_PATCH && 
    fetch $PKG_URL_TLS
    
    return $?
}

do_uncompress() {
    cd $TMP

    #descomprimiendo fuentes
    tar zxvf $FETCH_DIR/$PKG_NAME-$PKG_VERSION.tar.gz
    
    cd $TMP/$PKG_NAME-$PKG_VERSION
    
    tar zxvf $FETCH_DIR/pfixtls-0.8.16-$PKG_VERSION-0.9.7b.tar.gz
    
    return $?
}

do_patch() {
    cd $PKG_SRC
    
    patch -p1 < pfixtls-0.8.16-$PKG_VERSION-0.9.7b/pfixtls.diff
    
    zcat $FETCH_DIR/$PKG_NAME-2.0-ns-mx-acl-patch.gz | patch -p0
    
    patch -p1 < $PKG_HOME/files/postfix-2.0.9-get-FQDN.patch
    
    return $?
}

do_configure() {
    cd $PKG_SRC

    local mycc="-DHAS_PCRE -DUSE_SSL -DUSE_SASL_AUTH -I/usr/include/sasl"
    local mylibs="-L/usr/lib -lpcre -ldl -lcrypt -lpthread -lssl -lcrypto -lsasl2"
    
    mycc="$mycc -DDEF_CONFIG_DIR=\\\"/etc/postfix\\\""
	mycc="$mycc -DDEF_MANPAGE_DIR=\\\"/usr/man\\\""
	mycc="$mycc -DDEF_README_DIR=\\\"/usr/doc/$PKG_NAME-$PKG_VERSION/readme\\\""
	mycc="$mycc -DDEF_SAMPLE_DIR=\\\"/usr/doc/$PKG_NAME-$PKG_VERSION/sample\\\""
    
    make CC="gcc" OPT="$CFLAGS" CCARGS="$mycc" AUXLIBS="$mylibs" \
		makefiles
    
    return $?
}

do_install() {
    cd $PKG_SRC
    
    /bin/sh postfix-install \
		-non-interactive \
		install_root="$PKG_DEST" \
		config_directory="/usr/doc/$PKG_NAME-$PKG_VERSION/defaults" \
		readme_directory="/usr/doc/$PKG_NAME-$PKG_VERSION/readme" \
		sample_directory="/usr/doc/$PKG_NAME-$PKG_VERSION/sample" \
		manpage_directory="/usr/man" \
		mail_owner="postfix" \
		setgid_group="postdrop"
        
    return $?
}

do_postinstall() {
    cd $PKG_SRC
    
    cp auxiliary/rmail/rmail $PKG_DEST/usr/bin/rmail
    
    mkdir -p $PKG_DEST/etc/postfix
    
    cp $PKG_DOC/defaults/{*.cf,post*-*} $PKG_DEST/etc/postfix
        
    mkdir -p $PKG_DEST/etc/{sasl2,rc.d}
    mkdir -p $PKG_DEST/usr/lib/sasl2
    
    cp $PKG_HOME/files/rc.postfix $PKG_DEST/etc/rc.d
    
    cp $PKG_HOME/files/smtpd.conf $PKG_DEST/etc/sasl2
    ( cd $PKG_DEST/usr/lib/sasl2 ; ln -s /etc/sasl2/smtpd.conf )
    
    cp $PKG_HOME/files/saslpass $PKG_DEST/etc/postfix
    
    mkdir -p $PKG_DOC

    cp $PKG_DOC_FILES $PKG_DOC
    cp -R html $PKG_DOC
    find $PKG_DOC -type f -exec chmod 644 {} \;
    find $PKG_DOC -type d -exec chmod 755 {} \;

    #Eliminando simbolos en binarios
    strip_all $PKG_DEST

    #Comprimiendo paginas man
    gzip_man $PKG_DEST$PKG_PREFIX/man

    #Creando descripcion del paquete
    mkdir -p $PKG_DEST/install

    cat $PKG_HOME/files/slack-desc > $PKG_DEST/install/slack-desc
    cat $PKG_HOME/files/doinst.sh > $PKG_DEST/install/doinst.sh
}
