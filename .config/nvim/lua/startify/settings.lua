local execute = require("utils").execute

math.randomseed(os.time())
local function ten()
    local temp = {}
    for i = 1,10 do
        if math.random() > 0.5 then temp[i] = [[/]] else temp[i] = [[\]] end
    end
    return string.format("   %s", table.concat(temp))
end

local header = {
  ten(),
  ten(),
  ten(),
  ten(),
  ten(),
}

vim.g.startify_enable_special = 0
vim.g.startify_custom_header = header
vim.g.startify_lists = {
  { type = 'dir',       header = { '   MRU ' .. vim.fn.getcwd() }},
  { type = 'files',     header = { '   MRU' }},
  { type = 'sessions',  header = { '   Sessions' }},
  { type = 'bookmarks', header = { '   Bookmarks' }}
}
vim.g.startify_bookmarks = {
  { c = '~/.config/nvim' },
  { p = '~/Projects' }
}

-- I broke something and startify's FileType Icons won't show up unless this is enabled?
execute([[
function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) .  " " .  entry_path'
endfunction
]])