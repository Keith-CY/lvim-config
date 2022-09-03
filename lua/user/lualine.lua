
local M = {}

M.setup = function()
  local components = require("lvim.core.lualine.components")
  lvim.builtin.lualine.sections.lualine_a = {
    components.mode,
  }
  lvim.builtin.lualine.sections.lualine_b = {
    components.branch,
    components.filename,
    components.location,
  }
  lvim.builtin.lualine.sections.lualine_c = {
    components.diagnostics,
    components.diff,
  }
  lvim.builtin.lualine.sections.lualine_x = {
    components.treesitter,
    components.lsp,
    components.encoding,
    components.spaces,
    components.filetype,
  }
end

return M
