# Nushell Environment Config File

use ~/.config/nushell/modules/prompt.nu

# Use nushell functions to define your right and left prompt
let-env PROMPT_COMMAND = { prompt create-left-prompt }
let-env PROMPT_COMMAND_RIGHT = { prompt create-right-prompt }

# The prompt indicators are environmental variables that represent the state of the prompt
let-env PROMPT_INDICATOR = { [(ansi c) " => "] | str collect }
let-env PROMPT_INDICATOR_VI_INSERT = { " <- " }
let-env PROMPT_INDICATOR_VI_NORMAL = { " => " }
let-env PROMPT_MULTILINE_INDICATOR = { "::: " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
let-env ENV_CONVERSIONS = {
	"PATH": {
		from_string: { |s| $s | split row (char esep) }
		to_string: { |v| $v | str collect (char esep) }
	}
	"Path": {
		from_string: { |s| $s | split row (char esep) }
		to_string: { |v| $v | str collect (char esep) }
	}
}

# Directories to search for scripts when calling source or use
let-env NU_LIB_DIRS = [
	($nu.config-path | path dirname | path join 'scripts')
	($nu.config-path | path dirname | path join 'modules')
]

# Directories to search for plugin binaries when calling register
let-env NU_PLUGIN_DIRS = [
	($nu.config-path | path dirname | path join 'plugins')
]

let-env PATH = (
	$env.PATH
	| append $"($env.HOME)/.local/bin"
)

let-env LC_ALL = 'en_US.UTF-8'
let-env TERMINAL = 'kitty'
let-env EDITOR = 'nvim'
let-env MANPAGER = 'nvim +Man! -c "colorscheme default"'
