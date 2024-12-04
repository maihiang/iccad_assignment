#!/bin/bash
ls -l ~ | awk '{if ($9 ~ /^[hH]/) print "\x1b[43m" $0 "\x1b[0m"; else print $0}'