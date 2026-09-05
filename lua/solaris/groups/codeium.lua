local M = {}

M.url = "https://github.com/Exafunction/codeium.nvim"

---@type solaris.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    CodeiumSuggestion = { fg = c.fg_muted },
  }
  return ret
end

return M
