# Q part
## Q2.1


## Q2.2

# P part
All scripts have been uploaded to github `https://github.com/maihiang/iccad_assignment`, and I won't repeat my codes below.
## P2.1
1. First, in order to generate a code without a stop, we should use `while true;` code block.
2. The Function 1 and 2 are close, so we should program them in the same file.
    - I use a variable `count` to count how many times I have printed "Hello World!".
    - `count` is initially 0, and everytime I input `1` to print "Hello World!", `count` will add 1 to itself.
3. For the Function 3, I need to find the line with file name started with `h`, so it's important to use `awk`.
    - For the result of `ls -l`, the 9th column is file name, which we should pay attention with.
    - Regular Expression is used to examine if the file name starts with `h`.
    - In order to highlight the target line, I use the ANSI escape code to make the background yellow.
4. For the Function 4, I need to check if the file exists and is excutable
    - I use `if [[ -f $file_name && -x $file_name ]]; then` code.
    - After it, I use `head` command to show the first 16 characters.
    - Then I use `xxd -p` to translate characters into ascii code, as well as 16 bytes.
5. For the Function 5, most of the code is the same as Function 4.
    - A variant `origin_hex` is used to store the first 16 bytes of the file we input
    - For the other files in the same diractory, I use another variant `hex_data` to store their bytes.
    - By combining `origin_hex` and `hex_data`, I can find the file needed.
6. For the Function 6, ftp is important.
    - By exploring the site `alpha.gnu.org`, I can only log in the ftp server anonymously, as well as using `anonymous@alpha.gnu.org`
    - `EOF` is used to run commands in FTP
    - After ftp, `awk` is used to show files we want.
7. Here I want to list some problems I meet.
    1. I can't run `*.sh` created by `touch`.
        - Using `chmod u+x *.sh` is useful.
    2. Function 3 to 6 is a bit complex, for which it's hard to program in one shell script.
        - With module programming, adding `source *.sh` is useful.
    3. In the main shell, I use variant `$input` to select mode. But if I type `q`, it can't be campared with numbers in `if [[ $input -eq 1 ]] `
        - Using Regular Expression is useful for this situation.
    4. Every time menu appears, it will show many lines, which is hard to be distinguished from the result below.
        - so I use `ANSI escape code` to highlight results.
    5. Vim on linux is a bit difficult to use.
        - I use `neovim` on linux and `vim extention` on VSCode.
    6. `count = "0"` will lead to errors.
        - Change it to `count="0"`.

## P2.2
As is known to all, `<` is used to redirect stdin, `>` or `>>` is used to redirect stdout and `2>` is used to redirct stderr.
So it's eazy to find the solution: 
`./demo_inout < input_file.txt > output_file.txt 2> error_file.txt`

## P2.3
1. The script is run with arguments, so it's important to use `for domain in "$@";`.
2. In order to check if the ping is success, I can check the return value of `ping`, using `$?`.
3. In order to divide domains into to parts, I use two arraies to store 2 groups of domains.
4. In order to sort two groups in different ways, I can use `sort` command.