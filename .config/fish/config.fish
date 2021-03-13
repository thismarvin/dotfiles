set fish_add_path $HOME/.local/bin
set fish_add_path $HOME/.cargo/bin

set -U fish_greeting ""
set -U fish_color_command 7daea3 #7daea3
set -U fish_color_error ea6962 #ea6962
set -U fish_color_quote e78a4e #e78a4e
set -U fish_color_comment e78a4e #e78a4e
set -U fish_color_autosuggestion 928374 #928374

set -gx EDITOR nvim
set -gx FZF_DEFAULT_COMMAND "fd --type f"
set -gx BAT_THEME "ansi"

alias reload="source ~/.config/fish/config.fish"
alias edit="nvim ~/.config/fish/config.fish"
alias l="exa"
alias v="nvim"

starship init fish | source
zoxide init fish | source
