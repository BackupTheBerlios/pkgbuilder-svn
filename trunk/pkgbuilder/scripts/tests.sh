#!/bin/sh

source ../build.rc

source functions.sh

do_init() {
	i=0
}

testnumber() {
	let i=$i+1
	
	echo -n "$i: "
}

do_assertTrue() {
	testnumber
	
	test $1 -eq 0
	
	result_msg $?
}

do_assertFalse() {
	testnumber
	
	test $1 -ne 0

	result_msg $?
}

do_assertEquals() {
	testnumber
	
	test "$1" = "$2"
    RETVAL=$?
	
    if [ $RETVAL -ne 0 ] ; then
        echo -n "\"$1\" not equals to \"$2\" => "
    fi
    
    result_msg $RETVAL
}

do_assertNotEquals() {
	testnumber
	
	test "$1" != "$2"
    RETVAL=$?
    
    if [ $RETVAL -ne 0 ] ; then
        echo -n "\"$1\" equals to \"$2\" => "
    fi
	
	result_msg $RETVAL
}

echo "=> extract_version tests"
do_init
do_assertEquals "`extract_version libjpeg-6b`" "6b"
do_assertEquals "`extract_version esp-gs`" ""
do_assertEquals "`extract_version vim-a-b-6.1`" "6.1"
do_assertEquals "`extract_version vim3_b-6.1`" "6.1"
do_assertEquals "`extract_version vim3_b-6.1_9`" "6.1_9"
do_assertEquals "`extract_version vim3_b-2003_11_20`" "2003_11_20"
do_assertEquals "`extract_version vim3+3-6.1`" "6.1"
do_assertEquals "`extract_version divx4linux-20030428`" "20030428"
do_assertEquals "`extract_version asdf-asdf-2003_04_03`" "2003_04_03"

echo "=> extract_name tests"
do_init
do_assertEquals "`extract_name vim-6.1`" "vim"
do_assertEquals "`extract_name vim-a-b-6.1`" "vim-a-b"
do_assertEquals "`extract_name vim3_b-6.1`" "vim3_b"
do_assertEquals "`extract_name vim3_b-6.1_9`" "vim3_b"
do_assertEquals "`extract_name vim3_b-2003_11_20`" "vim3_b"
do_assertEquals "`extract_name vim3+3-6.1`" "vim3+3"
do_assertEquals "`extract_name vims-d5-6.1.d`" "vims-d5"
do_assertEquals "`extract_name vims-asdf-d`" "vims-asdf-d"
do_assertEquals "`extract_name gnome-vfs-2`" "gnome-vfs"

echo "=> extract_meta tests"
do_init
do_assertEquals "`extract_meta '>=asdf'`" "asdf"
do_assertEquals "`extract_meta '=asdf'`" "asdf"
do_assertEquals "`extract_meta '!asdf'`" "asdf"
do_assertEquals "`extract_meta 'asdf'`" "asdf"
do_assertEquals "`extract_meta '>=asdf/pkg'`" "asdf"

echo "=> use tests"
do_init
use fam ; do_assertFalse $?
use fame ; do_assertTrue $?

echo "=> is_installed tests"
do_init
is_installed gvim ; do_assertTrue $?
is_installed gvim 6.1 ; do_assertFalse $?
is_installed vimes 6.2 ; do_assertFalse $?
is_installed gettext ; do_assertTrue $?
is_installed bzip2 ; do_assertTrue $?
is_installed glibc ; do_assertTrue $?
is_installed skljdf ; do_assertFalse $?
is_installed libjpeg ; do_assertTrue $?
is_installed libjpeg 6b ; do_assertTrue $?
is_installed glibc 2.3* ; do_assertTrue $?
is_installed lilo 22.5.7.2 1 ; do_assertTrue $?
is_installed lilo 22.5.7.2 4 ; do_assertFalse $?

echo "=> latest_version tests"
do_init
do_assertEquals "`latest_version xap nedit`" "5.4"
do_assertEquals "`latest_version xap gaim`" "0.75"
do_assertEquals "`latest_version l divx4linux`" "20030428"
do_assertEquals "`latest_version xap mplayer`" "1.0pre3"
do_assertEquals "`latest_version ap docbook-xml-dtd`" "4.1.2"

echo "=> installed_version tests"
do_init
do_assertEquals "`installed_version gettext`" "0.14.1"
do_assertEquals "`installed_version bzip2`" "1.0.2"
do_assertEquals "`installed_version glibc`" "2.3.2"
do_assertEquals "`installed_version libjpeg`" "6b"
do_assertEquals "`installed_version divx4linux`" "20030428"

echo "=> installed_build tests"
do_init
do_assertEquals "`installed_build lincvs`" "am1"
do_assertEquals "`installed_build lilo`" "1"
do_assertNotEquals "`installed_build lilo`" "4"
