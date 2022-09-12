local M = {}

M.setup = function()
	lvim.plugins = {
		-- Additional Plugins
		{ "EdenEast/nightfox.nvim" },
		{ "catppuccin/nvim", as = "catppuccin" },
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
			cmd = "SymbolsOutline",
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
		-- {
		--   "github/copilot.vim"
		-- },
		{
			"folke/todo-comments.nvim",
			event = "BufRead",
			requires = "nvim-lua/plenary.nvim",
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
			run = "make install",
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
			-- ft = {
			--   "html",
			--   "javascript",
			--   "typescript",
			--   "javascriptreact",
			--   "typescriptreact",
			--   "css",
			--   "scss",
			--   "sass",
			-- }
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
		{
			"rhysd/devdocs.vim",
			cmd = {
				"DevDocs",
				"DevDocsAll",
			},
		},
	}
end

return M
