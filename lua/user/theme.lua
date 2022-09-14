-- ~/.config/lvim/lua/user/theme.lua
local M = {}

M.hi_colors = function()
	local colors = {
		bg = "#16161D",
		bg_alt = "#1F1F28",
		fg = "#DCD7BA",
		green = "#76946A",
		red = "#E46876",
	}
	local color_binds = {
		-- bg = { group = "NormalFloat", property = "background" },
		-- bg_alt = { group = "Cursor", property = "foreground" },
		fg = { group = "Cursor", property = "background" },
		green = { group = "diffAdded", property = "foreground" },
		red = { group = "diffRemoved", property = "foreground" },
	}
	local function get_hl_by_name(name)
		local ret = vim.api.nvim_get_hl_by_name(name.group, true)
		return string.format("#%06x", ret[name.property])
	end
	for k, v in pairs(color_binds) do
		local found, color = pcall(get_hl_by_name, v)
		if found then
			colors[k] = color
		end
	end
	return colors
end

M.telescope_theme = function()
	local function set_bg(group, bg)
		vim.cmd("hi " .. group .. " guibg=" .. bg)
	end

	local function set_fg_bg(group, fg, bg)
		vim.cmd("hi " .. group .. " guifg=" .. fg .. " guibg=" .. bg)
	end

	local colors = M.hi_colors()
	set_fg_bg("TelescopeBorder", colors.bg_alt, colors.bg)
	set_fg_bg("TelescopePromptBorder", colors.bg, colors.bg)
	set_fg_bg("TelescopePromptNormal", colors.fg, colors.bg_alt)
	set_fg_bg("TelescopePromptPrefix", colors.red, colors.bg)
	set_fg_bg("TelescopePreviewTitle", colors.bg, colors.green)
	set_fg_bg("TelescopePromptTitle", colors.bg, colors.red)
	set_fg_bg("TelescopeResultsTitle", colors.bg, colors.bg)
	set_fg_bg("TelescopeResultsBorder", colors.bg, colors.bg)
	set_fg_bg("LvimInfoHeader", colors.bg, colors.green)
	set_fg_bg("LvimInfoIdentifier", colors.red, colors.bg_alt)
	set_bg("TelescopeSelection", colors.bg_alt)
	set_bg("TelescopeNormal", colors.bg)
end

M.setup = function()
	lvim.builtin.telescope.defaults.prompt_prefix = "  "
	lvim.builtin.telescope.defaults.borderchars = {
		prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		results = { "─", "▐", "─", "│", "╭", "▐", "▐", "╰" },
		preview = { " ", "│", " ", "▌", "▌", "╮", "╯", "▌" },
	}
	lvim.builtin.telescope.defaults.selection_caret = "  "
	lvim.builtin.telescope.defaults.layout_config = {
		width = 0.90,
		height = 0.85,
		preview_cutoff = 120,
		prompt_position = "bottom",
		horizontal = {
			preview_width = function(_, cols, _)
				return math.floor(cols * 0.6)
			end,
		},
		vertical = {
			width = 0.9,
			height = 0.95,
			preview_height = 0.5,
		},

		flex = {
			horizontal = {
				preview_width = 0.9,
			},
		},
	}
	lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
end

return M
