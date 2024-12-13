#!/bin/bash
echo -e "\x1b[43mIt may take a while, please wait with patience.\x1b[0m"
echo "Files below has not changed since 2005"
ftp -p alpha.gnu.org <<EOF | awk '
{
    if ($8 ~ /^[0-9]{4}$/) {  # Check if the date is 4 numbers
        year = $8;
    } else {
        year = 2024;  # It has been edited within a year
    }
    if (year < 2006) {
        print $0;
    }
}
'
anonymous
ls /gnu
bye
EOF
