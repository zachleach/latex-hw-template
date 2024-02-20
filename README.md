```bash
function clone_latex() {
	[[ ${1} == "" ]] && return 0
	git clone https://github.com/zachleach/latex-hw-template ${1}
	cd ${1} 
	rm -rf .git/ README.md 

	echo "% body.tex" > "body.tex"
	echo "% $(date +"%Y.%m.%d"), by @zachleach" >> "body.tex"
	echo "" >> "body.tex"
	echo "" >> "body.tex"

	vi +4 "body.tex"
}
```
