local colors, config = require("solaris.colors").setup()

local hl = {}

hl.normal = {
  a = { bg = colors.yellow, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.yellow },
  c = { bg = colors.bg_statusline, fg = colors.fg_sidebar },
}

hl.insert = {
  a = { bg = colors.green, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.green },
}

hl.command = {
  a = { bg = colors.orange, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.orange },
}

hl.visual = {
  a = { bg = colors.purple, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.purple },
}

hl.replace = {
  a = { bg = colors.red, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.red },
}

hl.terminal = {
  a = { bg = colors.teal, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.teal },
}

hl.inactive = {
  a = { bg = colors.bg_statusline, fg = colors.yellow },
  b = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = "bold" },
  c = { bg = colors.bg_statusline, fg = colors.fg_gutter },
}

if config.lualine_bold then
  for _, mode in pairs(hl) do
    mode.a.gui = "bold"
  end
end

return hl
