local M = {}

M.url = "https://github.com/supermaven-inc/supermaven-nvim"

---@type solaris.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    SupermavenSuggestion = { fg = c.fg_muted },
  }
  return ret
end

return M
