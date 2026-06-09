local config = require("solaris.config")

local M = {}

---@param opts? solaris.Config
function M.load(opts)
  opts = require("solaris.config").extend(opts)
  return require("solaris.theme").setup(opts)
end

M.setup = config.setup

return M
