#!/bin/sh

source build.rc

source scripts/functions.sh

echo -n "00: " ; test "`extract_version libjpeg-6b`" == "6b" && echo "<OK>" || echo "*error*"
echo -n "01: " ; test "`extract_version esp-gs`" == "" && echo "<OK>" || echo "*error*"
echo -n "02: " ; test "`extract_version vim-a-b-6.1`" == "6.1" && echo "<OK>" || echo "*error*"
echo -n "03: " ; test "`extract_version vim3_b-6.1`" == "6.1" && echo "<OK>" || echo "*error*"
echo -n "04: " ; test "`extract_version vim3_b-6.1_9`" == "6.1_9" && echo "<OK>" || echo "*error*"
echo -n "05: " ; test "`extract_version vim3_b-2003_11_20`" == "2003_11_20" && echo "<OK>" || echo "*error*"
echo -n "06: " ; test "`extract_version vim3+3-6.1`" == "6.1" && echo "<OK>" || echo "*error*"
echo -n "07: " ; test "`extract_version divx4linux-20030428`" == "20030428" && echo "<OK>" || echo "*error*"

echo -n "08: " ; test "`extract_name vim-6.1`" == "vim" && echo "<OK>" || echo "*error*"
echo -n "09: " ; test "`extract_name vim-a-b-6.1`" == "vim-a-b" && echo "<OK>" || echo "*error*"
echo -n "10: " ; test "`extract_name vim3_b-6.1`" == "vim3_b" && echo "<OK>" || echo "*error*"
echo -n "11: " ; test "`extract_name vim3_b-6.1_9`" == "vim3_b" && echo "<OK>" || echo "*error*"
echo -n "12: " ; test "`extract_name vim3_b-2003_11_20`" == "vim3_b" && echo "<OK>" || echo "*error*"
echo -n "13: " ; test "`extract_name vim3+3-6.1`" == "vim3+3" && echo "<OK>" || echo "*error*"
echo -n "14: " ; test "`extract_name vims-d5-6.1.d`" == "vims-d5" && echo "<OK>" || echo "*error*"
echo -n "15: " ; test "`extract_name vims-asdf-d`" == "vims-asdf-d" && echo "<OK>" || echo "*error*"

echo -n "16: " ; test "`extract_meta '>=asdf'`" == "asdf" && echo "<OK>" || echo "*error*"
echo -n "17: " ; test "`extract_meta '=asdf'`" == "asdf" && echo "<OK>" || echo "*error*"
echo -n "18: " ; test "`extract_meta '!asdf'`" == "asdf" && echo "<OK>" || echo "*error*"
echo -n "19: " ; test "`extract_meta 'asdf'`" == "asdf" && echo "<OK>" || echo "*error*"
echo -n "20: " ; test "`extract_meta '>=asdf/pkg'`" == "asdf" && echo "<OK>" || echo "*error*"

echo -n "21: " ; is_installed vim && echo "<OK>" || echo "*error*"
echo -n "22: " ; is_installed vim 6.1 && echo "*error*" || echo "<OK>"
echo -n "23: " ; is_installed vim 6.2 && echo "<OK>" || echo "*error*"
echo -n "24: " ; is_installed vimes 6.2 && echo "*error*" || echo "<OK>"
echo -n "25: " ; is_installed gettext && echo "<OK>" || echo "*error*"
echo -n "26: " ; is_installed glib2 && echo "<OK>" || echo "*error*"
echo -n "27: " ; is_installed oggutils && echo "<OK>" || echo "*error*"
echo -n "28: " ; is_installed skljdf && echo "*error*" || echo "<OK>"
echo -n "29: " ; is_installed gimp 1.2* && echo "*error*" || echo "<OK>"
echo -n "30: " ; is_installed gimp 1.3* && echo "<OK>" || echo "*error*"

echo -n "31: " ; test "`latest_version xap nedit`" == "5.4rc2" && echo "<OK>" || echo "*error*"
echo -n "32: " ; test "`latest_version xap gaim`" == "0.74" && echo "<OK>" || echo "*error*"
echo -n "33: " ; test "`latest_version l divx4linux`" == "20030428" && echo "<OK>" || echo "*error*"

echo -n "34: " ; test "`installed_version gettext`" == "0.11.5" && echo "<OK>" || echo "*error*"
echo -n "35: " ; test "`installed_version gettext-tools`" == "0.11.5" && echo "<OK>" || echo "*error*"
echo -n "36: " ; test "`installed_version glib2`" == "2.2.3" && echo "<OK>" || echo "*error*"
echo -n "37: " ; test "`installed_version oggutils`" == "1.0" && echo "<OK>" || echo "*error*"
echo -n "38: " ; test "`installed_version libjpeg`" == "6b" && echo "<OK>" || echo "*error*"
echo -n "38: " ; test "`installed_version divx4linux`" == "20030428" && echo "<OK>" || echo "*error*"
