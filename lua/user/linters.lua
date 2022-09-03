local M = {}

M.setup = function()
	local linters = require("lvim.lsp.null-ls.linters")
	linters.setup({
		{
			exe = "eslint",
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
			},
		},
		{
			exe = "luacheck",
			filetype = {
				"selene",
			},
		},

		--   { exe = "flake8", filetypes = { "python" } },
		--   {
		--     exe = "shellcheck",
		--     ---@usage arguments to pass to the formatter
		--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
		--     args = { "--severity", "warning" },
		--   },
		--   {
		--     exe = "codespell",
		--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
		--     filetypes = { "javascript", "typescript", "python" },
		--   },
	})
end

return M
