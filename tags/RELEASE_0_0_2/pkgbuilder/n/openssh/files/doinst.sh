# If the sshd user/group don't exist, add them:
if grep "^sshd:x:" etc/passwd 1> /dev/null 2> /dev/null ; then
  true
else
  echo "sshd:x:33:33:sshd:/:" >> etc/passwd
fi
if grep "^sshd::" etc/group 1> /dev/null 2> /dev/null ; then
  true
else
  echo "sshd::33:sshd" >> etc/group
fi
if grep "^sshd:" etc/shadow 1> /dev/null 2> /dev/null ; then
  true
else
  echo "sshd:*:9797:0:::::" >> etc/shadow
fi
