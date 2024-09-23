#!/bin/bash

# make
# 2024.02.10, by @zachleach
# compile and open tex file 

MAIN="main"
[[ ! -e ${MAIN}.tex ]] && exit 1
temp1=$(mktemp)
temp2=$(mktemp)

# run twice to generate TOC
pdflatex "$MAIN".tex "$MAIN".pdf | tee "$temp1"
[[ $(grep 'Fatal error' "$temp1") != "" ]] && exit 1
pdflatex "$MAIN".tex "$MAIN".pdf | tee "$temp2"
[[ $(grep 'Fatal error' "$temp2") != "" ]] && exit 1

rm *.aux *.log *.out
explorer.exe "$MAIN".pdf

[[ $(git status | grep 'HEAD detached') != "" ]] && exit 1
git add . && git commit -m "$(date "+%Y-%m-%d %H:%M:%S")" 
