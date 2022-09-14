local M = {}

M.setup = function()
	lvim.builtin.bufferline.options.numbers = function(opts)
		return string.format("[%s]", opts.id)
	end
	-- {"buffer_id"}
	lvim.builtin.bufferline.options.show_buffer_close_icons = false
end

return M
