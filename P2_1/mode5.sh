#!/bin/bash
echo -e "\x1b[43mInput a file name:\x1b[0m"
read file_name
if [[ -f $file_name && -x $file_name ]]; then
    origin_hex=$(head -c 16 $file_name | xxd -p)
    echo "The hex of the file you input is $origin_hex."
    echo "Files below have the same 16 bytes header as the file you input:"
else
    echo "File does not exist"
fi

find . -maxdepth 1 -type f ! -name "$(basename "$file_name")" -print0 | while IFS= read -r -d '' file; do
    hex_data=$(head -c 16 "$file" | xxd -p)
    if [[ "$hex_data" == "$origin_hex" ]]; then
        echo "$(basename "$file")"
    fi
done