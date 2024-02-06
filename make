#!/bin/bash
if [[ -e main.tex ]]; then 
	MAIN="main"

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

	rm *.aux
	rm *.log *.out *.toc

	explorer.exe "$MAIN".pdf
fi

if [[ $# -eq 0 ]] && [[ $(git status | grep 'HEAD detached') == "" ]]; then
	git add . && git commit -m "$(date "+%Y-%m-%d %H:%M:%S")" 
fi
