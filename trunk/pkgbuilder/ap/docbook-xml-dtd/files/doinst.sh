#!/bin/sh

if [ ! -e /etc/xml/docbook ]; then /usr/bin/xmlcatalog --noout --create \
/etc/xml/docbook; fi &&
/usr/bin/xmlcatalog --noout --add "public" \
"-//OASIS//ELEMENTS DocBook XML Information Pool V4.1//EN" \
"file:///usr/share/xml/docbook/xml-dtd-4.1/dbpoolx.mod" \
/etc/xml/docbook &&
/usr/bin/xmlcatalog --noout --add "public" \
"-//OASIS//DTD DocBook XML V4.1//EN" \
"http://oasis-open.org/docbook/xml/4.1/docbookx.dtd" \
/etc/xml/docbook &&
/usr/bin/xmlcatalog --noout --add "public" \
"-//OASIS//ENTITIES DocBook XML Character Entities V4.1//EN" \
"file:///usr/share/xml/docbook/xml-dtd-4.1/dbcentx.mod" \
/etc/xml/docbook &&
/usr/bin/xmlcatalog --noout --add "public" \
"-//OASIS//ENTITIES DocBook XML Notations V4.1//EN" \
"file:///usr/share/xml/docbook/xml-dtd-4.1/dbnotnx.mod" \
/etc/xml/docbook &&
/usr/bin/xmlcatalog --noout --add "public" \
"-//OASIS//ENTITIES DocBook XML Additional General Entities V4.1//EN" \
"file:///usr/share/xml/docbook/xml-dtd-4.1/dbgenent.mod" \
/etc/xml/docbook &&
/usr/bin/xmlcatalog --noout --add "public" \
"-//OASIS//ELEMENTS DocBook XML Document Hierarchy V4.1//EN" \
"file:///usr/share/xml/docbook/xml-dtd-4.1/dbhierx.mod" \
/etc/xml/docbook &&
/usr/bin/xmlcatalog --noout --add "public" \
"-//OASIS//DTD XML Exchange Table Model 19990315//EN" \
"file:///usr/share/xml/docbook/xml-dtd-4.1/soextblx.dtd" \
/etc/xml/docbook &&
/usr/bin/xmlcatalog --noout --add "public" \
"-//OASIS//DTD DocBook XML CALS Table Model V4.1//EN" \
"file:///usr/share/xml/docbook/xml-dtd-4.1/calstblx.dtd" \
/etc/xml/docbook &&
/usr/bin/xmlcatalog --noout --add "rewriteSystem" \
"http://www.oasis-open.org/docbook/xml/4.1" \
"file:///usr/share/xml/docbook/xml-dtd-4.1" \
/etc/xml/docbook &&
/usr/bin/xmlcatalog --noout --add "rewriteURI" \
"http://www.oasis-open.org/docbook/xml/4.1" \
"file:///usr/share/xml/docbook/xml-dtd-4.1" \
/etc/xml/docbook &&
/usr/bin/xmlcatalog --noout --add "delegatePublic" \
"-//OASIS//ENTITIES DocBook XML" \
"file:///etc/xml/docbook" /etc/xml/catalog &&
/usr/bin/xmlcatalog --noout --add "delegatePublic" \
"-//OASIS//DTD DocBook XML" \
"file:///etc/xml/docbook" /etc/xml/catalog &&
/usr/bin/xmlcatalog --noout --add "delegateSystem" \
"http://www.oasis-open.org/docbook/" \
"file:///etc/xml/docbook" /etc/xml/catalog &&
/usr/bin/xmlcatalog --noout --add "delegateURI" \
"http://www.oasis-open.org/docbook/" \
"file:///etc/xml/docbook" /etc/xml/catalog

if [ ! -e /etc/xml/docbook ]; then /usr/bin/xmlcatalog --noout --create \
/etc/xml/docbook; fi &&
/usr/bin/xmlcatalog --noout --add "public" \
"-//OASIS//ELEMENTS DocBook XML Information Pool V4.1.2//EN" \
"file:///usr/share/xml/docbook/xml-dtd-4.1.2/dbpoolx.mod" \
/etc/xml/docbook &&
/usr/bin/xmlcatalog --noout --add "public" \
"-//OASIS//DTD DocBook XML V4.1.2//EN" \
"http://oasis-open.org/docbook/xml/4.1.2/docbookx.dtd" \
/etc/xml/docbook &&
/usr/bin/xmlcatalog --noout --add "public" \
"-//OASIS//ENTITIES DocBook XML Character Entities V4.1.2//EN" \
"file:///usr/share/xml/docbook/xml-dtd-4.1.2/dbcentx.mod" \
/etc/xml/docbook &&
/usr/bin/xmlcatalog --noout --add "public" \
"-//OASIS//ENTITIES DocBook XML Notations V4.1.2//EN" \
"file:///usr/share/xml/docbook/xml-dtd-4.1.2/dbnotnx.mod" \
/etc/xml/docbook &&
/usr/bin/xmlcatalog --noout --add "public" \
"-//OASIS//ENTITIES DocBook XML Additional General Entities V4.1.2//EN" \
"file:///usr/share/xml/docbook/xml-dtd-4.1.2/dbgenent.mod" \
/etc/xml/docbook &&
/usr/bin/xmlcatalog --noout --add "public" \
"-//OASIS//ELEMENTS DocBook XML Document Hierarchy V4.1.2//EN" \
"file:///usr/share/xml/docbook/xml-dtd-4.1.2/dbhierx.mod" \
/etc/xml/docbook &&
/usr/bin/xmlcatalog --noout --add "public" \
"-//OASIS//DTD XML Exchange Table Model 19990315//EN" \
"file:///usr/share/xml/docbook/xml-dtd-4.1.2/soextblx.dtd" \
/etc/xml/docbook &&
/usr/bin/xmlcatalog --noout --add "public" \
"-//OASIS//DTD DocBook XML CALS Table Model V4.1.2//EN" \
"file:///usr/share/xml/docbook/xml-dtd-4.1.2/calstblx.dtd" \
/etc/xml/docbook &&
/usr/bin/xmlcatalog --noout --add "rewriteSystem" \
"http://www.oasis-open.org/docbook/xml/4.1.2" \
"file:///usr/share/xml/docbook/xml-dtd-4.1.2" \
/etc/xml/docbook &&
/usr/bin/xmlcatalog --noout --add "rewriteURI" \
"http://www.oasis-open.org/docbook/xml/4.1.2" \
"file:///usr/share/xml/docbook/xml-dtd-4.1.2" \
/etc/xml/docbook &&
/usr/bin/xmlcatalog --noout --add "delegatePublic" \
"-//OASIS//ENTITIES DocBook XML" \
"file:///etc/xml/docbook" /etc/xml/catalog &&
/usr/bin/xmlcatalog --noout --add "delegatePublic" \
"-//OASIS//DTD DocBook XML" \
"file:///etc/xml/docbook" /etc/xml/catalog &&
/usr/bin/xmlcatalog --noout --add "delegateSystem" \
"http://www.oasis-open.org/docbook/" \
"file:///etc/xml/docbook" /etc/xml/catalog &&
/usr/bin/xmlcatalog --noout --add "delegateURI" \
"http://www.oasis-open.org/docbook/" \
"file:///etc/xml/docbook" /etc/xml/catalog

( /usr/bin/install-catalog --add /etc/sgml/xml-docbook-dtd-4.1.cat \
/usr/share/sgml/docbook/xml-dtd-4.1/catalog )
( /usr/bin/install-catalog --add /etc/sgml/xml-docbook-dtd-4.1.cat \
/etc/sgml/sgml-docbook.cat )

( /usr/bin/install-catalog --add /etc/sgml/xml-docbook-dtd-4.1.2.cat \
/usr/share/sgml/docbook/xml-dtd-4.1.2/catalog )
( /usr/bin/install-catalog --add /etc/sgml/xml-docbook-dtd-4.1.2.cat \
/etc/sgml/sgml-docbook.cat )
