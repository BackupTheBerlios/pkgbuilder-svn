#!/bin/sh
replace() {
  NEW="$1"
  OLD="`dirname $NEW`/`basename $NEW .nvidia`"

  mv $OLD $OLD.xfree
  mv $NEW $OLD
}

replace usr/X11R6/include/GL/glext.h.nvidia
replace usr/X11R6/include/GL/gl.h.nvidia
replace usr/X11R6/include/GL/glx.h.nvidia
replace usr/X11R6/include/GL/glxtokens.h.nvidia

mv usr/X11R6/lib/modules/extensions/libglx.a usr/X11R6/lib/modules/extensions/libglx.a.xfree