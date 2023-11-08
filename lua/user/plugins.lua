local M = {}

M.setup = function()
	lvim.plugins = {
		-- Additional Plugins
		{ "EdenEast/nightfox.nvim" },
		{ "catppuccin/nvim", name = "catppuccin" },
		-- {"folke/tokyonight.nvim"},
		{
			"folke/trouble.nvim",
			cmd = "TroubleToggle",
		},
		{
			"phaazon/hop.nvim",
			event = "BufRead",
			config = function()
				require("hop").setup()
				vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
				vim.api.nvim_set_keymap("n", "s", ":HopWord<cr>", { silent = true })
			end,
		},
		{
			"ggandor/lightspeed.nvim",
			event = "BufRead",
		},
		-- {
		--   "wfxr/minimap.vim",
		--   run = "cargo install --locked code-minimap",
		--   config = function()
		--     vim.cmd ("let g:minimap_width = 30")
		--     vim.cmd ("let g:minimap_auto_start = 1")
		--     vim.cmd ("let g:minimap_auto_start_win_enter = 1")
		--   end,
		-- },
		{
			"nacro90/numb.nvim",
			event = "BufRead",
			config = function()
				require("numb").setup({
					show_numbers = true,
					show_cursorline = true,
				})
			end,
		},
		{
			"windwp/nvim-spectre",
			event = "BufRead",
			config = function()
				require("spectre").setup()
			end,
		},
		{
			"sindrets/diffview.nvim",
			event = "BufRead",
		},
		{
			"f-person/git-blame.nvim",
			event = "BufRead",
			config = function()
				vim.cmd("highlight default link gitblame SpecialComment")
				vim.g.gitblame_enabled = 0
			end,
		},
		{
			"pwntester/octo.nvim",
			event = "BufRead",
			config = function()
				require("octo").setup()
			end,
		},
		{
			"windwp/nvim-ts-autotag",
			event = "InsertEnter",
			config = function()
				require("nvim-ts-autotag").setup()
			end,
		},
		{
			"p00f/nvim-ts-rainbow",
		},
		{
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup({ "*" }, {
					RGB = true, -- #RGB hex codes
					RRGGBB = true, -- #RRGGBB hex codes
					RRGGBBAA = true, -- #RRGGBBAA hex codes
					rgb_fn = true, -- CSS rgb() and rgba() functions
					hsl_fn = true, -- CSS hsl() and hsla() functions
					css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
					css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
				})
			end,
		},
		{
			"rmagatti/goto-preview",
			config = function()
				require("goto-preview").setup({
					width = 120, -- Width of the floating window
					height = 80, -- Height of the floating window
					default_mappings = true, -- Bind default mappings
					debug = false, -- Print debug information
					opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
					post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
					focus_on_open = true,
					-- You can use "default_mappings = true" setup option
					-- Or explicitly set keybindings
					-- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
					-- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
					-- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
				})
			end,
		},
		{
			"simrat39/symbols-outline.nvim",
			config = function()
				require("symbols-outline").setup({

					highlight_hovered_item = true,
					show_guides = true,
					auto_preview = true,
					position = "right",
					relative_width = true,
					width = 15,
					auto_close = false,
					show_numbers = false,
					show_relative_numbers = false,
					show_symbol_details = true,
					preview_bg_highlight = "Pmenu",
					autofold_depth = nil,
					auto_unfold_hover = true,
					fold_markers = { "", "" },
					wrap = false,
					keymaps = { -- These keymaps can be a string or a table for multiple keys
						close = { "<Esc>", "q" },
						goto_location = "<Cr>",
						focus_location = "o",
						hover_symbol = "<C-space>",
						toggle_preview = "K",
						rename_symbol = "r",
						code_actions = "a",
						fold = "h",
						unfold = "l",
						fold_all = "W",
						unfold_all = "E",
						fold_reset = "R",
					},
					lsp_blacklist = {},
					symbol_blacklist = {},
					symbols = {
						File = { icon = "", hl = "TSURI" },
						Module = { icon = "", hl = "TSNamespace" },
						Namespace = { icon = "", hl = "TSNamespace" },
						Package = { icon = "", hl = "TSNamespace" },
						Class = { icon = "𝓒", hl = "TSType" },
						Method = { icon = "ƒ", hl = "TSMethod" },
						Property = { icon = "", hl = "TSMethod" },
						Field = { icon = "", hl = "TSField" },
						Constructor = { icon = "", hl = "TSConstructor" },
						Enum = { icon = "ℰ", hl = "TSType" },
						Interface = { icon = "ﰮ", hl = "TSType" },
						Function = { icon = "", hl = "TSFunction" },
						Variable = { icon = "", hl = "TSConstant" },
						Constant = { icon = "", hl = "TSConstant" },
						String = { icon = "𝓐", hl = "TSString" },
						Number = { icon = "#", hl = "TSNumber" },
						Boolean = { icon = "⊨", hl = "TSBoolean" },
						Array = { icon = "", hl = "TSConstant" },
						Object = { icon = "⦿", hl = "TSType" },
						Key = { icon = "🔐", hl = "TSType" },
						Null = { icon = "NULL", hl = "TSType" },
						EnumMember = { icon = "", hl = "TSField" },
						Struct = { icon = "𝓢", hl = "TSType" },
						Event = { icon = "🗲", hl = "TSType" },
						Operator = { icon = "+", hl = "TSOperator" },
						TypeParameter = { icon = "𝙏", hl = "TSParameter" },
					},
				})
			end,
		},
		{
			"kevinhwang91/nvim-bqf",
			event = { "BufRead", "BufNew" },
			config = function()
				require("bqf").setup({
					auto_enable = true,
					preview = {
						win_height = 12,
						win_vheight = 12,
						delay_syntax = 80,
						border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
					},
					func_map = {
						vsplit = "",
						ptogglemode = "z,",
						stoggleup = "",
					},
					filter = {
						fzf = {
							action_for = { ["ctrl-s"] = "split" },
							extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
						},
					},
				})
			end,
		},
		{
			"folke/lsp-colors.nvim",
			event = "BufRead",
		},
		{
			"ray-x/lsp_signature.nvim",
			event = "BufRead",
			config = function()
				require("lsp_signature").setup({
					hint_prefix = "⭐️ ",
				})
			end,
		},
		{
			"andymass/vim-matchup",
			event = "CursorMoved",
			config = function()
				vim.g.matchup_matchparen_offscreen = { method = "pop" }
			end,
		},
		{
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("indent_blankline").setup({
					space_char_blankline = " ",
					show_current_context = true,
					show_current_context_start = true,
				})
			end,
		},
		{
			"zbirenbaum/copilot.lua",
			after = { "copilot.lua", "nvim-cmp" },
			config = function()
				vim.defer_fn(function()
					require("copilot").setup({
						panel = {
							enabled = true,
							auto_refresh = true,
							keymap = {
								jump_prev = "[[",
								jump_next = "]]",
								accept = "<S-CR>",
								refresh = "gr",
								open = "<M-CR>",
							},
							layout = {
								position = "bottom", -- | top | left | right
								ratio = 0.4,
							},
						},
						suggestion = {
							enabled = true,
							auto_trigger = true,
							debounce = 75,
							keymap = {
								accept = "<S-CR>",
								accept_word = false,
								accept_line = false,
								prev = "<M-[>",
								next = "<M-]>",
								dismiss = "ESC",
							},
						},
						filetypes = { ["*"] = true },
						copilot_node_command = "node",
					})
				end, 100)
			end,
		},

		{
			"folke/todo-comments.nvim",
			event = "BufRead",
			dependencies = "nvim-lua/plenary.nvim",
			config = function()
				require("todo-comments").setup()
			end,
		},
		{
			"ellisonleao/glow.nvim",
			config = function()
				require("glow").setup({
					width = 120,
				})
			end,
		},
		{
			"metakirby5/codi.vim",
		},
		{
			"mrjones2014/dash.nvim",
			build = "make install",
		},
		{
			"kevinhwang91/rnvimr",
			cmd = "RnvimrToggle",
			config = function()
				vim.g.rnvimr_draw_border = 1
				vim.g.rnvimr_pick_enable = 1
				vim.g.rnvimr_bw_enable = 1
			end,
		},
		{
			"aca/emmet-ls",
			config = function()
				local lspconfig = require("lspconfig")
				local configs = require("lspconfig/configs")

				local capabilities = vim.lsp.protocol.make_client_capabilities()
				capabilities.textDocument.completion.completionItem.snippetSupport = true
				capabilities.textDocument.completion.completionItem.resolveSupport = {
					properties = {
						"documentation",
						"detail",
						"additionalTextEdits",
					},
				}

				if not lspconfig.emmet_ls then
					configs.emmet_ls = {
						cmd = { "emmet-ls", "--stdio" },
						filetypes = {
							"html",
							"css",
							"scss",
							"sass",
							"javascript",
							"typescript",
							"javascriptreact",
							"typescriptreact",
						},
						root_dir = function()
							return vim.loop.cwd()
						end,
						settings = {},
					}
				end
				lspconfig.emmet_ls.setup({
					capabilities = capabilities,
				})
			end,
		},
		-- {
		-- 	"rhysd/devdocs.vim",
		-- 	cmd = {
		-- 		"DevDocs",
		-- 		"DevDocsAll",
		-- 	},
		-- },
		-- {
		-- 	"jackMort/ChatGPT.nvim",
		-- 	event = "VeryLazy",
		-- 	config = function()
		-- 		require("chatgpt").setup({
		-- 			api_key_cmd = "cat ~/.config/lvim/gpt_key",
		-- 		})
		-- 	end,
		-- 	dependencies = {
		-- 		"MunifTanjim/nui.nvim",
		-- 		"nvim-lua/plenary.nvim",
		-- 		"nvim-telescope/telescope.nvim",
		-- 	},
		-- },
	}
end

return M
