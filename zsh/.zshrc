# History settings.
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify

# Autocompletion settings.
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case insensitive tab completion

# Aliases
alias edit_zshrc="nvim ~/.zshrc"
alias edit_zshenv="nvim ~/.zshenv"
alias edit_vimrc="nvim ~/.config/nvim/init.lua"
alias reload="source ~/.zshrc"
alias ..="cd .."
alias v="nvim"
alias ls="exa --icons"
alias ll="exa -l --icons"
alias lt="exa -T --icons"
alias lla="exa -la --icons"
alias n="n -deo"
alias ssh="kitty +kitten ssh"
alias d="kitty +kitten diff"

# Keymaps
bindkey "^R" history-incremental-search-backward
