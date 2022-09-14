local M = {}

M.setup = function()
	local components = require("lvim.core.lualine.components")
	lvim.builtin.lualine.sections.lualine_a = {
		components.mode,
	}
	lvim.builtin.lualine.sections.lualine_b = {
		components.branch,
		{
			"filename",
			color = {},
			cond = nil,
			file_status = true,
			path = 1,
		},
		-- components.filename,
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
	lvim.builtin.lualine.inactive_sections.lualine_c = {
		{
			"filename",
			file_status = true,
			path = 1,
		},
	}
end

return M
