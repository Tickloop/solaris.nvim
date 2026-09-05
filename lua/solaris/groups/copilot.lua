local M = {}

M.url = "https://github.com/zbirenbaum/copilot.lua"

---@type solaris.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    CopilotAnnotation = { fg = c.fg_muted },
    CopilotSuggestion = { fg = c.fg_muted },
  }
  return ret
end

return M
