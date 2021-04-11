local gl = require("galaxyline")
local gls = gl.section
local vcs = require("galaxyline.provider_vcs")

local colors = {
  bg = "#32302f",
  fg = "#d4be98",
}

local mode_map = {
  n = "N",
  i = "I",
  c = "C",
  v = "V",
  V = "VL",
  [""] = "VB",
  c = "C",
  ["r?"] = ":CONFIRM",
  rm = "--MORE",
  R  = "R",
  Rv = "V",
  s  = "S",
  S  = "S",
  ["r"] = "HIT-ENTER",
  [""] = "S",
  t  = "T",
  ["!"]  = "SHELL",
}

local mode_color = {
  n = "#9D8F7C",
  i = "#7DAEA3",
  v = "#E78A4E",
  V = "#E78A4E",
  [""] = "#E78A4E",
  c = "#A9B665",
  t = "#D3869B",
}

local valid_buffer = function()
  return vim.fn.empty(vim.fn.expand("%:t")) ~= 1 and vim.fn.winwidth(0) >= 70
end

local get_vim_mode = function()
  local mode = mode_map[vim.fn.mode()]

  if mode == nil then
    return "?"
  end

  local color = mode_color[vim.fn.mode()]
  if color == nil then 
    color = mode_color[1]
  end
  vim.api.nvim_command(string.format("hi GalaxyMode guibg=%s", color))
  return string.format("  %s ", mode)

end

local get_git_branch = function()
  local branch = vcs.get_git_branch()
  if branch == nil then
    return ""
  end
  return string.format("   %s ", branch)
end

local get_filename = function()
  local filename = vim.fn.expand("%:t")
  local modified = ""
  if vim.bo.modifiable and vim.bo.modified then
    modified = " +"
  end
  return string.format("  %s%s", filename, modified)
end

local get_file_icon = function()
  if string.len(vim.bo.filetype) > 0 then
    local icon = vim.call("WebDevIconsGetFileTypeSymbol")
    return string.format("  %s ", icon)
  else
    return ""
  end
end

local get_diagnostics = function()
  local errors = vim.lsp.diagnostic.get_count(0, "Error")
  local warnings = vim.lsp.diagnostic.get_count(0, "Warning")
  if errors + warnings == 0 then
    return " "
  end
  return string.format(" %s  %s ", errors, warnings)
end

-- Left.
gls.left[1] = {
  Mode = {
    provider = get_vim_mode,
    highlight = { colors.bg },
  }
}

gls.left[2] = {
  Filler = {
    provider = function() return "" end,
    highlight = { "#9D8F7C", colors.bg },
  }
}

gls.left[3] = {
  GitBranch = {
    provider = get_git_branch,
    condition = valid_buffer,
    highlight = { colors.fg, "#504945" },
  }
}

gls.left[4] = {
  FileName = {
    provider = get_filename,
    condition = valid_buffer,
    highlight = { colors.fg, colors.bg }
  }
}

-- Right.
gls.right[1] = {
  Diagnostics = {
    provider = get_diagnostics,
    highlight = { colors.fg, colors.bg },
  }
}

gls.right[2] = {
  FileIcon = {
    provider = get_file_icon,
    highlight = { colors.fg, "#504945" },
  }
}
