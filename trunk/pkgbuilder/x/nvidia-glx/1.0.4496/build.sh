# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/x/nvidia-glx/1.0.4496/Attic/build.sh,v 1.2 2003/10/22 22:03:22 tomby Exp $
#
# nvidia-glx pkgbuilder script
#

include do_info
include do_fetch

include do_patch

include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_uncompress() {
    cd $TMP
    
    sh $FETCH_DIR/NVIDIA-Linux-x86-1.0-4496-pkg0.run --extract-only
    
    return $?
}

do_configure() {
    echo "configure: nothing to do"
}

do_build() {
    echo "build: nothing to do"
}

do_install() {
    mkdir -p $PKG_DEST/usr/X11R6/lib/modules/drivers
    mkdir -p $PKG_DEST/usr/X11R6/lib/modules/extensions
    mkdir -p $PKG_DEST/usr/X11R6/include/GL
    
    #El modulos de la tarjeta
    cp $PKG_SRC/usr/X11R6/lib/modules/drivers/nvidia_drv.o \
          $PKG_DEST/usr/X11R6/lib/modules/drivers/
    chmod -x $PKG_DEST/usr/X11R6/lib/modules/drivers/nvidia_drv.o

    #La extensión glx          
    cp $PKG_SRC/usr/X11R6/lib/modules/extensions/libglx.so.$PKG_VERSION \
          $PKG_DEST/usr/X11R6/lib/modules/extensions/libglx.so
 
    #Las librerías glx
    cp $PKG_SRC/usr/lib/libGL.so.$PKG_VERSION \
          $PKG_DEST/usr/X11R6/lib/

    cd $PKG_DEST/usr/X11R6/lib/
    ln -s libGL.so.$PKG_VERSION libGL.so
    ln -s libGL.so.$PKG_VERSION libGL.so.1
          
    cp $PKG_SRC/usr/lib/libGLcore.so.$PKG_VERSION \
          $PKG_DEST/usr/X11R6/lib/
          
    cd $PKG_DEST/usr/X11R6/lib/
    ln -s libGLcore.so.$PKG_VERSION libGLcore.so
    ln -s libGLcore.so.$PKG_VERSION libGLcore.so.1
          
    cp $PKG_SRC/usr/X11R6/lib/libXvMCNVIDIA.a \
          $PKG_DEST/usr/X11R6/lib/
          
    cp $PKG_SRC/usr/X11R6/lib/libXvMCNVIDIA.so.$PKG_VERSION \
          $PKG_DEST/usr/X11R6/lib/
          
    #Archivos include
    cp $PKG_SRC/usr/include/GL/*.h \
          $PKG_DEST/usr/X11R6/include/GL/
}

do_postinstall() {
    cd $PKG_SRC/usr/share/doc
    
    mkdir -p $PKG_DOC
    
    cp NVIDIA_Changelog README* XF86Config.sample $PKG_DOC
    
    mkdir -p $PKG_DEST/install
    
    cat $PKG_HOME/files/slack-desc > $PKG_DEST/install/slack-desc
    cat $PKG_HOME/files/doinst.sh > $PKG_DEST/install/doinst.sh
}
