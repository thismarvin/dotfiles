local command = vim.api.nvim_command

local function execute(expression)
    vim.api.nvim_exec(expression, true)
end

local function has(key)
    return vim.fn.has(key) == 1
end

local function set(expression)
    command(string.format("set " .. expression))
end

if has("termguicolors") then
    set("termguicolors")
end

execute([[
" Makes the background transparent.
function! TransparentMode()
  hi Normal guibg=NONE ctermbg=NONE
  hi NonText guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
endfunction

function! ThemeGruvboxMaterial()
  let g:gruvbox_material_background = 'hard'
  let g:gruvbox_material_diagnostic_line_highlight = 1

  colorscheme gruvbox-material

  hi LspDiagnosticsVirtualTextError guifg=#ea6962
  hi LspDiagnosticsVirtualTextWarning guifg=#d8a657
  hi LspDiagnosticsVirtualTextInformation guifg=#89b482
  hi LspDiagnosticsVirtualTextHint guifg=#89b482
endfunction

augroup styling
  autocmd!
  autocmd VimEnter * silent call ThemeGruvboxMaterial()
augroup end
]])
