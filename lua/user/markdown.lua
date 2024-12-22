local M = {}

M.setup = function()
	vim.api.nvim_create_augroup("markdown_wrap", { clear = true })
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "makrdown",
		command = "setlocal wrap",
		group = "markdown_wrap",
	})
end

return M
