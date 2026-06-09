local Util = require("solaris.util")

local M = {}

---@type table<string, Palette|fun(opts:solaris.Config):Palette>
M.styles = setmetatable({}, {
  __index = function(_, style)
    return vim.deepcopy(Util.mod("solaris.colors." .. style))
  end,
})

---@param opts? solaris.Config
function M.setup(opts)
  opts = require("solaris.config").extend(opts)

  local palette = M.styles[opts.style]
  if type(palette) == "function" then
    palette = palette(opts)
  end

  ---@class ColorScheme: Palette
  local colors = palette

  Util.bg = colors.bg
  Util.fg = colors.fg

  colors.none = "NONE"

  colors.diff = {
    add = Util.blend_bg(colors.green, 0.20),
    delete = Util.blend_bg(colors.red, 0.20),
    change = Util.blend_bg(colors.blue, 0.15),
    text = colors.blue,
  }

  colors.git.ignore = colors.dark3
  colors.black = Util.blend_bg(colors.bg, 0.8, "#000000")
  colors.border_highlight = Util.blend_bg(colors.yellow, 0.8)
  colors.border = colors.black

  colors.bg_popup = colors.bg_dark
  colors.bg_statusline = colors.bg_dark

  colors.bg_sidebar = opts.styles.sidebars == "transparent" and colors.none
    or opts.styles.sidebars == "dark" and colors.bg_dark
    or colors.bg

  colors.bg_float = opts.styles.floats == "transparent" and colors.none
    or opts.styles.floats == "dark" and colors.bg_dark
    or colors.bg

  colors.bg_visual = Util.blend_bg(colors.yellow, 0.15)
  colors.bg_search = Util.blend_bg(colors.yellow, 0.3)
  colors.fg_sidebar = colors.fg_dark
  colors.fg_float = colors.fg

  colors.error = colors.red
  colors.todo = colors.blue
  colors.warning = colors.orange
  colors.info = colors.blue
  colors.hint = colors.teal

  colors.rainbow = {
    colors.blue,
    colors.yellow,
    colors.green,
    colors.teal,
    colors.pink,
    colors.purple,
    colors.orange,
    colors.red,
  }

  --- @class TerminalColors
  colors.terminal = {
    black          = colors.black,
    black_bright   = colors.terminal_black,
    red            = colors.red,
    red_bright     = Util.brighten(colors.red),
    green          = colors.green,
    green_bright   = Util.brighten(colors.green),
    yellow         = colors.yellow,
    yellow_bright  = Util.brighten(colors.yellow),
    blue           = colors.blue,
    blue_bright    = Util.brighten(colors.blue),
    magenta        = colors.pink,
    magenta_bright = Util.brighten(colors.pink),
    cyan           = colors.teal,
    cyan_bright    = Util.brighten(colors.teal),
    white          = colors.fg_dark,
    white_bright   = colors.fg,
  }

  opts.on_colors(colors)

  return colors, opts
end

return M
