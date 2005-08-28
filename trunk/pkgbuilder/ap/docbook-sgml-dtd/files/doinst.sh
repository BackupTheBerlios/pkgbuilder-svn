( usr/bin/install-catalog --add /etc/sgml/sgml-docbook-dtd-3.0.cat \
  /usr/share/sgml/docbook/sgml-dtd-3.0/catalog )
( usr/bin/install-catalog --add /etc/sgml/sgml-docbook-dtd-3.0.cat \
  /etc/sgml/sgml-docbook.cat )

( usr/bin/install-catalog --add /etc/sgml/sgml-docbook-dtd-3.1.cat \
  /usr/share/sgml/docbook/sgml-dtd-3.1/catalog )
( usr/bin/install-catalog --add /etc/sgml/sgml-docbook-dtd-3.1.cat \
  /etc/sgml/sgml-docbook.cat )

( usr/bin/install-catalog --add /etc/sgml/sgml-docbook-dtd-4.0.cat \
  /usr/share/sgml/docbook/sgml-dtd-4.0/catalog )
( usr/bin/install-catalog --add /etc/sgml/sgml-docbook-dtd-4.0.cat \
  /etc/sgml/sgml-docbook.cat )

( usr/bin/install-catalog --add /etc/sgml/sgml-docbook-dtd-4.1.cat \
  /usr/share/sgml/docbook/sgml-dtd-4.1/catalog )
( usr/bin/install-catalog --add /etc/sgml/sgml-docbook-dtd-4.1.cat \
  /etc/sgml/sgml-docbook.cat )

( usr/bin/install-catalog --add /etc/sgml/sgml-docbook-dtd-4.2.cat \
  /usr/share/sgml/docbook/sgml-dtd-4.2/catalog )
( usr/bin/install-catalog --add /etc/sgml/sgml-docbook-dtd-4.2.cat \
  /etc/sgml/sgml-docbook.cat )

( for file in `find etc/sgml/ -name "*.cat"` etc/sgml/catalog ; do
    awk '/"$/ { print $1 " " $2 }
        ! /"$/ { print $1 " \"" $2 "\"" }' $file > $file.new
    mv $file.new $file
done )
