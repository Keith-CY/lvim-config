local M = {}

M.setup = function()
	lvim.builtin.bufferline.options.numbers = "buffer_id"
	lvim.builtin.bufferline.options.show_buffer_close_icons = false
end

return M
