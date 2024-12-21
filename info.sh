#!/usr/bin/bash

bat ~/Documents/Verses/"$(date +\%j).txt"

cat <<- EOF
    journalctl -b -1 --no-pager
    journalctl -rb -1
    systemctl status
    Ctrl+Alt+F3 back Ctrl+Alt+F1

EOF
echo "      SYDNEY"
TZ='Australia/Sydney' date +"%A, %d. %B '%y. | %R"
echo ""
echo "      MANILA / HONG KONG"
TZ='Asia/Manila' date +"%A, %d. %B '%y. | %R"
echo ""
echo "      NEW DELHI"
TZ='Asia/Colombo' date +"%A, %d. %B '%y. | %R"
echo ""
echo "      DUBAI"
TZ='Asia/Dubai' date +"%A, %d. %B '%y. | %R"
echo ""
echo "      SOMBOR"
date +"%A, %d. %B '%y. | %R"
echo ""
echo "      NEW YORK"
TZ='America/New_York' date +"%A, %d. %B '%y. | %R"

echo ""
ncal -3wbS

echo "Kernel: "
uname -r
