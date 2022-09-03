local M = {}

M.setup = function()
  local formatters = require "lvim.lsp.null-ls.formatters"
  formatters.setup {
    -- { exe = "black", filetypes = { "python" } },
    -- { exe = "isort", filetypes = { "python" } },
    {
      exe = "prettier",
      ---@usage arguments to pass to the formatter
      -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
      args = {
        "--print-width", "120"
      },
      ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
      -- filetypes = {
      --   "javascript",
      --   "javascriptreact",
      --   "typescript",
      --   "typescriptreact",
      --   "scss",
      --   "css",
      --   "html",
      --   "json",
      --   "yaml",
      --   "markdown"
      -- },
    },
    {
      exe = 'eslint',
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact"
      }
    },
    {
      exe = 'lua-format',
      filetype = {
        'lua'
      }
    },
  }
end

return M
