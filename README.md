```bash
# clone this template to dir passed as argument
function clone_tex_article() {
	[[ ${1} == "" ]] && return 0
	git clone https://github.com/zachleach/latex-hw-template ${1}
	cd ${1} && rm -rf .git README.md
}
```
