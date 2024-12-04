#!/bin/bash
echo -e "\x1b[43mInput a file name:\x1b[0m"
read file_name
if [[ -f $file_name && -x $file_name ]]; then
    head -c 16 $file_name | xxd -p
else
    echo "File does not exist"
fi
