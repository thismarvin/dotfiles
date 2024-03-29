# Nushell Config File

alias v = ^nvim
alias nnn = ^nnn -deo
alias ssh = ^kitty +kitten ssh
alias gs = ^git status
alias gd = ^git diff
alias ga = ^git add
alias gc = ^git commit

# use ~/.config/nushell/completions/nu.nu *
# use ~/.config/nushell/completions/git.nu *
# use ~/.config/nushell/completions/make.nu *
# use ~/.config/nushell/completions/cargo.nu *

let default_theme = {
	# Color for nushell primitives
	separator: white
	leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
	header: green_bold
	empty: blue
	bool: white
	int: white
	filesize: white
	duration: white
	date: white
	range: white
	float: white
	string: white
	nothing: white
	binary: white
	cellpath: white
	row_index: green_bold
	record: white
	list: white
	block: white
	hints: dark_gray

	# Shapes are used to change the cli syntax highlighting
	shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
	shape_binary: purple_bold
	shape_bool: light_cyan
	shape_int: purple_bold
	shape_float: purple_bold
	shape_range: yellow_bold
	shape_internalcall: cyan_bold
	shape_external: cyan
	shape_externalarg: green_bold
	shape_literal: blue
	shape_operator: yellow
	shape_signature: green_bold
	shape_string: green
	shape_string_interpolation: cyan_bold
	shape_datetime: cyan_bold
	shape_list: cyan_bold
	shape_table: blue_bold
	shape_record: cyan_bold
	shape_block: blue_bold
	shape_filepath: cyan
	shape_globpattern: cyan_bold
	shape_variable: purple
	shape_flag: blue_bold
	shape_custom: green
	shape_nothing: light_cyan
}

# The default config record. This is where much of your global configuration is setup.
let-env config = {
	filesize_metric: false
	table_mode: rounded # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
	use_ls_colors: true
	rm_always_trash: false
	color_config: $default_theme
	use_grid_icons: true
	footer_mode: "25" # always, never, number_of_rows, auto
	quick_completions: true # set this to false to prevent auto-selecting completions when only one remains
	partial_completions: true # set this to false to prevent partial filling of the prompt
	completion_algorithm: "fuzzy" # prefix, fuzzy
	animate_prompt: false # redraw the prompt every second
	float_precision: 2
	buffer_editor: "nvim" # command that will be used to edit the current line buffer with ctrl+o, if unset fallback to $env.EDITOR and $env.VISUAL
	use_ansi_coloring: true
	filesize_format: "auto" # b, kb, kib, mb, mib, gb, gib, tb, tib, pb, pib, eb, eib, zb, zib, auto
	edit_mode: emacs # emacs, vi
	max_history_size: 10000 # Session has to be reloaded for this to take effect
	sync_history_on_enter: true # Enable to share the history between multiple sessions, else you have to close the session to persist history to file
	shell_integration: true # enables terminal markers and a workaround to arrow keys stop working issue
	disable_table_indexes: false # set to true to remove the index column from tables
	# cd_with_abbreviations: true # set to true to allow you to do things like cd s/o/f and nushell expand it to cd some/other/folder
	# case_sensitive_completions: false # set to true to enable case-sensitive completions
	# enable_external_completion: true # set to false to prevent nushell looking into $env.PATH to find more suggestions, `false` recommended for WSL users as this look up my be very slow

	# hooks: {
	# 	pre_prompt: [{
	# 		$nothing # replace with source code to run before the prompt is shown
	# 	}]
	# 	pre_execution: [{
	# 		$nothing # replace with source code to run before the repl input is run
	# 	}]
	# 	env_change: {
	# 		PWD: [{|before, after|
	# 			$nothing # replace with source code to run if the PWD environment is different since the last repl input
	# 		}]
	# 	}
	# }
	menus: [
		# Configuration for default nushell menus
		# Note the lack of souce parameter
		{
			name: completion_menu
			only_buffer_difference: false
			marker: " |= "
			type: {
				layout: columnar
				columns: 4
				col_width: 20 # Optional value. If missing all the screen width is used to calculate column width
				col_padding: 2
			}
			style: {
				text: green
				selected_text: green_reverse
				description_text: yellow
			}
		}
		{
			name: history_menu
			only_buffer_difference: true
			marker: " ?= "
			type: {
				layout: list
				page_size: 10
			}
			style: {
				text: green
				selected_text: green_reverse
				description_text: yellow
			}
		}
		{
			name: help_menu
			only_buffer_difference: true
			marker: " ?= "
			type: {
				layout: description
				columns: 4
				col_width: 20 # Optional value. If missing all the screen width is used to calculate column width
				col_padding: 2
				selection_rows: 4
				description_rows: 10
			}
			style: {
				text: green
				selected_text: green_reverse
				description_text: yellow
			}
		}
		# Example of extra menus created using a nushell source
		# Use the source field to create a list of records that populates
		# the menu
		{
			name: commands_menu
			only_buffer_difference: false
			marker: " #= "
			type: {
				layout: columnar
				columns: 4
				col_width: 20
				col_padding: 2
			}
			style: {
				text: green
				selected_text: green_reverse
				description_text: yellow
			}
			source: { |buffer, position|
				$nu.scope.commands
				| where command =~ $buffer
				| each { |it| {value: $it.command description: $it.usage} }
			}
		}
		{
			name: vars_menu
			only_buffer_difference: true
			marker: " #= "
			type: {
				layout: list
				page_size: 10
			}
			style: {
				text: green
				selected_text: green_reverse
				description_text: yellow
			}
			source: { |buffer, position|
				$nu.scope.vars
				| where name =~ $buffer
				| sort-by name
				| each { |it| {value: $it.name description: $it.type} }
			}
		}
		{
			name: commands_with_description
			only_buffer_difference: true
			marker: " #= "
			type: {
				layout: description
				columns: 4
				col_width: 20
				col_padding: 2
				selection_rows: 4
				description_rows: 10
			}
			style: {
				text: green
				selected_text: green_reverse
				description_text: yellow
			}
			source: { |buffer, position|
				$nu.scope.commands
				| where command =~ $buffer
				| each { |it| {value: $it.command description: $it.usage} }
			}
		}
	]
	keybindings: [
		{
			name: completion_menu
			modifier: none
			keycode: tab
			mode: emacs # Options: emacs vi_normal vi_insert
			event: {
				until: [
					{ send: menu name: completion_menu }
					{ send: menunext }
				]
			}
		}
		{
			name: completion_previous
			modifier: shift
			keycode: backtab
			mode: [emacs, vi_normal, vi_insert] # Note: You can add the same keybinding to all modes by using a list
			event: { send: menuprevious }
		}
		{
			name: history_menu
			modifier: control
			keycode: char_r
			mode: emacs
			event: { send: menu name: history_menu }
		}
		{
			name: next_page
			modifier: control
			keycode: char_x
			mode: emacs
			event: { send: menupagenext }
		}
		{
			name: undo_or_previous_page
			modifier: control
			keycode: char_z
			mode: emacs
			event: {
				until: [
					{ send: menupageprevious }
					{ edit: undo }
				]
			}
		}
		# Keybindings used to trigger the user defined menus
		{
			name: commands_menu
			modifier: control
			keycode: char_t
			mode: [emacs, vi_normal, vi_insert]
			event: { send: menu name: commands_menu }
		}
		{
			name: vars_menu
			modifier: control
			keycode: char_y
			mode: [emacs, vi_normal, vi_insert]
			event: { send: menu name: vars_menu }
		}
		{
			name: commands_with_description
			modifier: control
			keycode: char_u
			mode: [emacs, vi_normal, vi_insert]
			event: { send: menu name: commands_with_description }
		}
	]
}
