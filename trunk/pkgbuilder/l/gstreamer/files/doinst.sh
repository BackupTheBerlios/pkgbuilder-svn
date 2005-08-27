if [ -x usr/bin/gst-register ]; then
  sbin/ldconfig > /dev/null 2>&1
  rm -f var/cache/gstreamer-0.8/{compreg,registry}.xml
  usr/bin/gst-register --gst-registry=var/cache/gstreamer-0.8/registry.xml > /dev/null 2>&1
  usr/bin/gst-compprep --gst-registry=var/cache/gstreamer-0.8/registry.xml > /dev/null 2>&1
fi
