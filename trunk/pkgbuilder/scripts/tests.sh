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
	
	result_msg $?
}

do_assertNotEquals() {
	testnumber
	
	test "$1" != "$2"
	
	result_msg $?
}

echo "=> extract_version tests"
do_init
do_assertEquals "`extract_version libjpeg-6b`" "6b" 
do_assertEquals "`extract_version esp-gs`" ""
do_assertEquals "`extract_version esp-gs-7.07.1-i686-am1`" "7.07.1"
do_assertEquals "`extract_version esp-gs-7.07.1-i686-1am`" "7.07.1"
do_assertEquals "`extract_version esp-gs-7.07.1-i686-1`" "7.07.1"
do_assertEquals "`extract_version vim-a-b-6.1`" "6.1"
do_assertEquals "`extract_version vim3_b-6.1`" "6.1"
do_assertEquals "`extract_version vim3_b-6.1_9`" "6.1_9"
do_assertEquals "`extract_version vim3_b-2003_11_20`" "2003_11_20"
do_assertEquals "`extract_version vim3+3-6.1`" "6.1"
do_assertEquals "`extract_version divx4linux-20030428`" "20030428"

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

echo "=> extract_meta tests"
do_init
do_assertEquals "`extract_meta '>=asdf'`" "asdf"
do_assertEquals "`extract_meta '=asdf'`" "asdf"
do_assertEquals "`extract_meta '!asdf'`" "asdf"
do_assertEquals "`extract_meta 'asdf'`" "asdf"
do_assertEquals "`extract_meta '>=asdf/pkg'`" "asdf"

echo "=> is_installed tests"
do_init
is_installed vim ; do_assertTrue $?
is_installed vim 6.1 ; do_assertFalse $?
is_installed vim 6.2 ; do_assertTrue $?
is_installed vimes 6.2 ; do_assertFalse $?
is_installed gettext ; do_assertTrue $?
is_installed glib2 ; do_assertTrue $?
is_installed oggutils ; do_assertFalse $?
is_installed skljdf ; do_assertFalse $?
is_installed gimp 1.2* ; do_assertFalse $?
is_installed gimp 1.3* ; do_assertFalse $?

echo "=> latest_version tests"
do_init
do_assertEquals "`latest_version xap nedit`" "5.4"
do_assertEquals "`latest_version xap gaim`" "0.74"
do_assertEquals "`latest_version l divx4linux`" "20030428"

echo "=> installed_version tests"
do_init
do_assertEquals "`installed_version gettext`" "0.11.5"
do_assertEquals "`installed_version gettext-tools`" "0.11.5"
do_assertEquals "`installed_version glib2`" "2.2.3"
do_assertEquals "`installed_version oggutils`" ""
do_assertEquals "`installed_version libjpeg`" "6b"
do_assertEquals "`installed_version divx4linux`" "20030428"
