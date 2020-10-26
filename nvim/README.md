# init.vim

my settings for [Neovim](https://github.com/neovim/neovim)

## Usage

From within your `init.vim`, simply `source` any of the given files included in this repository's `config` folder.

```vim
" Example usage.
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/mappings.vim
```

If you included the `plugins.vim` file then make sure to first setup [vim-plug](https://github.com/junegunn/vim-plug). Once that is complete open Neovim and run the following command to install all the plugins:

```vim
:PlugInstall
```

## Prerequisites

- [code-minimap](https://github.com/wfxr/code-minimap)
- [ctags](https://github.com/universal-ctags/ctags)
- [fzf](https://github.com/junegunn/fzf)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
