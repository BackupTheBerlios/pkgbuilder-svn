( useradd postfix )
( groupadd postfix )
( groupadd postdrop )
( usermod -G mail postfix )
( chown root:postdrop usr/sbin/postdrop )
( chown root:postdrop usr/sbin/postqueue )
( chmod 2711 usr/sbin/postdrop )
( chmod 2711 usr/sbin/postqueue )
( chmod 0600 etc/postfix/saslpass )
( chown root.postfix var/spool/postfix )
( chown postfix.postfix var/spool/postfix/* )
( chgrp postdrop var/spool/postfix/maildrop )
( chgrp postdrop var/spool/postfix/public )
( chmod 755 var/spool/postfix )
( chmod 700 var/spool/postfix/* )
( chmod 730 var/spool/postfix/maildrop )
( chmod 755 var/spool/postfix/pid )
( chmod 710 var/spool/postfix/public )
( usr/sbin/postconf -c "etc/postfix" -e \
        "alias_maps=hash:/etc/mail/aliases" \
        "alias_database=hash:/etc/mail/aliases" \
        "local_destination_concurrency_limit=2" \
        "default_destination_concurrency_limit=2" \
        "home_mailbox=.maildir/" )
