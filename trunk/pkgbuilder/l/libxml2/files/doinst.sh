#!/bin/sh

CATALOG=etc/xml/catalog

[ -e $CATALOG ] || usr/bin/xmlcatalog --noout --create $CATALOG
