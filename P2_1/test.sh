#!/bin/bash
count="0"
while true; do
    echo "1. Print a Hello World!"
    echo "2. Report how many times the script has printed Hello World! already"
    echo "3. Show all files under your home in long format, but any line containing file name beginning with "h" must be in yellow color"
    echo "4. Input a name, if the file exists and is executable, show its first 16 bytes in hexadecimal format"
    echo "5. Input a name, if the file exists and is executable, find all other files in the same directory with the same 16 bytes header"
    echo "6. Let '/usr/bin/ftp' visit alpha.gnu.org, and report what directories in '/gnu' have not changed after 2005"
    echo "q. Quit"
    echo "Enter a number (1-6) or 'q' to exit"
    read input
    echo -e "\n"
    if [[ "$input" =~ ^[1-6]$ ]]; then
        case "$input" in
        1) {
            echo -e "\x1b[43mHello World!\x1b[0m"
            let count=count+1
        } ;;
        2) {
            echo -e "\x1b[43mHello World! has been printed $count times\x1b[0m"
        } ;;
        3) {
            source ./mode3.sh
        } ;;
        4) {
            source ./mode4.sh
        } ;;
        5) {
            source ./mode5.sh
        } ;;
        6) {
            source ./mode6.sh
        } ;;
        esac
    elif [[ "$input" == "q" ]]; then
        echo "Exiting..."
        break
    else
        echo "Invalid input"
    fi
    echo -e "\n"
done
