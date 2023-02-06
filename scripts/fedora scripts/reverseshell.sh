#!/bin/bash

# Define directories to scan
scan_dirs=( "/" "/bin" "/sbin" "/etc" "/usr" )

# Use the grep command to search for known backdoor and reverse shell code in files
for dir in "${scan_dirs[@]}"
do
    echo "Scanning for backdoors and reverse shells in $dir..."
    grep -rniE "(bash -i >& /dev/tcp/.*/.* 0>&1)|(nc -e /bin/bash.*)" "$dir"
done
