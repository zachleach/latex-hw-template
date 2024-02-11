#!/bin/bash

# make
# 2024.02.10, by @zachleach
# compile and open tex file 

MAIN="main"
[[ ! -e ${MAIN}.tex ]] && exit 0
temp1=$(mktemp)
temp2=$(mktemp)

# run twice to generate TOC
pdflatex "$MAIN".tex "$MAIN".pdf | tee "$temp1"
if [[ $(grep 'Fatal error' "$temp1") != "" ]]; then
	exit 1
fi
pdflatex "$MAIN".tex "$MAIN".pdf | tee "$temp2"
if [[ $(grep 'Fatal error' "$temp2") != "" ]]; then
	exit 1
fi

rm *.aux *.log
explorer.exe "$MAIN".pdf
