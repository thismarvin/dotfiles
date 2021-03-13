set fish_add_path $HOME/.local/bin
set fish_add_path $HOME/.cargo/bin

set -U fish_greeting ""

# Set all fish colors to white.
set -U fish_color_normal white
set -U fish_color_status white
set -U fish_color_command white
set -U fish_color_quote white
set -U fish_color_redirection white
set -U fish_color_end white
set -U fish_color_error white
set -U fish_color_param white
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_search_match white --background=brblack
set -U fish_color_history_current --bold
set -U fish_color_operator white
set -U fish_color_escape white
set -U fish_color_cwd white
set -U fish_color_cwd_root white
set -U fish_color_valid_path white --underline
set -U fish_color_autosuggestion white brblack
set -U fish_color_user white
set -U fish_color_host white
set -U fish_color_host_remote white
set -U fish_color_cancel -r
set -U fish_pager_color_completion white
set -U fish_pager_color_description white yellow
set -U fish_pager_color_prefix white --bold --underline
set -U fish_pager_color_progress white --background=cyan
set -U fish_color_match --background=brblue
set -u fish_color_comment white

# Now just apply the colors I like.
set -U fish_color_command blue
set -U fish_color_error red
set -U fish_color_quote orange
set -U fish_color_comment orange
set -U fish_color_autosuggestion brblack

function fish_user_key_bindings
  fish_vi_key_bindings
end

set -gx EDITOR nvim
set -gx FZF_DEFAULT_COMMAND "fd --type f"
set -gx BAT_THEME "ansi"

alias reload="source ~/.config/fish/config.fish"
alias edit="nvim ~/.config/fish/config.fish"
alias l="exa"
alias v="nvim"

starship init fish | source
zoxide init fish | source
