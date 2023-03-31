local M = {}

lvim.leader = "space"

M.setup = function()
	lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

	lvim.builtin.which_key.mappings["t"] = {
		name = "+Trouble",
		r = { "<cmd>Trouble lsp_references<cr>", "References" },
		f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
		d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
		q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
		l = { "<cmd>Trouble loclist<cr>", "LocationList" },
		w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
	}

	lvim.builtin.which_key.mappings["i"] = {
		name = "Toggle Term",
		v = { "<cmd>ToggleTerm direction=vertical<cr>", "Vertical" },
		x = { "<cmd>ToggleTerm direction=horizontal<cr>", "Horizontal" },
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		t = { "<cmd>ToggleTermToggleAll<cr>", "Toggle" },
	}

	lvim.builtin.which_key.mappings["d"] = {
		name = "Diffview",
		o = { "<cmd>DiffviewOpen<CR>", "Open" },
		x = { "<cmd>DiffviewClose<CR>", "Close" },
		h = { "<cmd>DiffviewFileHistory<CR>", "File History" },
	}

	lvim.builtin.which_key.mappings["S"] = {
		name = "Spectre",
		o = { "<cmd>:lua require('spectre').open()<CR>", "Open" },
		w = { "<cmd>:lua require('spectre').open_visual({select_word=true})<CR>", "Search selected word" },
		i = { "<cmd>:lua require('spectre').open_file_search()<CR>", "Search in current file" },
		R = { "<cmd>:lua require('spectre.actions').run_replace()<CR>", "Replace all" },
		r = { "<cmd>:lua require('spectre.actions').run_current_replace()<CR>", "Replace current line" },
	}

	lvim.builtin.which_key.mappings["R"] = {
		name = "RnvimrToggle",
		t = { "<cmd>RnvimrToggle<CR>", "Toggle" },
		r = { "<cmd>RnvimrResize<CR>", "Resize" },
	}

	lvim.builtin.which_key.mappings["C"] = {
		name = "Copilot",
		p = { "<cmd>Copilot Panel<CR>", "Panel" },
		l = { "<cmd>:lua require('copilot.suggestion').accet_line()<CR>", "Accept Line" },
	}
end

return M
