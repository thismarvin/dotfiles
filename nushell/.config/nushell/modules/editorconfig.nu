export def new [] {
	let basic-editorconfig = "# https://editorconfig.org

root = true

[*]
charset = utf-8
end_of_line = lf
insert_final_newline = true

[Makefile]
indent_style = tab\n"

	if (ls -a | find -r '^\.editorconfig$' | empty?) {
		$basic-editorconfig | save .editorconfig
		echo 'Created a basic .editorconfig file.'
	} else {
		error make {
			msg: 'An .editorconfig file already exists.'
		}
	}
}
