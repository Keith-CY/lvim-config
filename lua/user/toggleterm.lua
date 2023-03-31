local M = {}

M.setup = function()
	lvim.keys.normal_mode["<C-t>"] = "<cmd>ToggleTerm direction=float<cr>"
end

return M
