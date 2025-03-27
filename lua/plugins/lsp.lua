
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      diagnostics = {
        -- Включаем виртуальный текст (показ ошибок рядом с кодом)
        virtual_text = {
          prefix = "●", -- Символ перед ошибкой (можно заменить, например, на "▎" или "■")
          spacing = 4, -- Отступ от текста
          source = "if_many", -- Показывать источник ошибки только если их несколько
        },
        -- Включаем подчеркивание ошибок
        underline = true,
        -- Включаем знаки в колонке слева (гаттер)
        signs = {
          active = true,
          values = {
            { name = "DiagnosticSignError", text = "✘" },
            { name = "DiagnosticSignWarn", text = "▲" },
            { name = "DiagnosticSignInfo", text = "ℹ" },
            { name = "DiagnosticHint", text = "➤" },
          },
        },
        -- Показывать всплывающее окно с ошибкой при наведении курсора
        float = {
          border = "rounded", -- Скругленные углы для окна
          source = "always", -- Всегда показывать источник ошибки
          header = "", -- Убрать заголовок
          prefix = "", -- Убрать префикс
        },
        severity_sort = true, -- Сортировать по уровню серьезности (ошибки выше предупреждений)
      },
      servers = {
        -- tsserver will be automatically installed with mason and loaded with lspconfig
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.gopls.setup({})
      lspconfig.ts_ls.setup({})
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
      "neovim/nvim-lspconfig", -- optional
    },
    opts = {}, -- your configuration
  },
  {
    "olrtg/nvim-emmet",
    config = function()
      vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation)
    end,
  },
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    opts = {
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "bashls",
        "tailwindcss",
        "cssmodules_ls",
        "css_variables",
        "cssls",
        "dockerls",
        "docker_compose_language_service",
        "dotls",
        "emmet_language_server",
        "emmet_ls",
        "gopls",
        "html",
        "superhtml",
        "eslint",
        "ts_ls",
        "jsonls",
        "ast_grep",
        "prismals",
        "pyright",
        "somesass_ls",
        "yamlls",
      },
    },
    config = function()
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "bashls",
        "tailwindcss",
        "cssmodules_ls",
        "css_variables",
        "cssls",
        "dockerls",
        "docker_compose_language_service",
        "dotls",
        "emmet_language_server",
        "emmet_ls",
        "gopls",
        "html",
        "superhtml",
        "eslint",
        "ts_ls",
        "jsonls",
        "ast_grep",
        "prismals",
        "pyright",
        "somesass_ls",
        "yamlls",
      }
    end,
  },
}
