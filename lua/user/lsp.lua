local M = {}

M.setup = function()
	require("lspconfig").solang.setup({
		cmd = { "solang", "--language-server" },
		filetypes = {
			"solidity",
		},
	})
end

return M
