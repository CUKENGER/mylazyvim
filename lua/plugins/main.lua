return {
  {
    "pocco81/auto-save.nvim",
    opts = {
      execution_message = {
        message = function()
          return ""
        end, -- Отключаем сообщение
        dim = 0.18, -- Неважно, но оставим
        cleaning_interval = 1250, -- Интервал очистки
      },
    },
  },
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  {
    "numToStr/Comment.nvim",
  },
  { "jose-elias-alvarez/typescript.nvim" },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  },
  {
    "SmiteshP/nvim-navic",
    "LunarVim/breadcrumbs.nvim",
  },
  {
    "saghen/blink.cmp",
    enabled = false,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    enabled = false,
  },
  {
    "snacks.nvim",
    opts = {
      scroll = { enabled = false },
    },
  },
}
