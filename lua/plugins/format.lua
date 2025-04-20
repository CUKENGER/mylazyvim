return {
  { "neovim/nvim-lspconfig" },
  -- {
  --   "nvimtools/none-ls.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   opts = function()
  --     local null_ls = require("null-ls")
  --     return {
  --       debug = true, -- Включаем отладку для логов
  --       sources = {
  --         null_ls.builtins.code_actions.eslint_d.with({
  --           condition = function(utils)
  --             return utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" })
  --           end,
  --         }),
  --         null_ls.builtins.diagnostics.eslint_d.with({
  --           condition = function(utils)
  --             return utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" })
  --           end,
  --         }),
  --       },
  --     }
  --   end,
  -- },
  -- conform.nvim
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        scss = { "prettierd", "prettier", stop_after_first = true },
        sass = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
}
