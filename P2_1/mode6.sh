#!/bin/bash
echo -e "\x1b[43mIt may take a while, please wait with patience.\x1b[0m"
echo "Files below has not changed since 2005"
ftp anonymous@alpha.gnu.org <<EOF | awk '
{
    if ($8 ~ /^[0-9]{4}$/) {
        year = $8;
    } else {
        year = 2024;  # 假设当前年份
    }
    if (year < 2006) {
        print $0;
    }
}
'
ls /gnu
bye
EOF
