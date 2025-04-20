return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter", -- Загружаем при входе в режим вставки
    opts = {
      check_ts = true, -- Интеграция с Treesitter
      ts_config = {
        lua = { "string", "source" }, -- Где включать автопары в Lua
        javascript = { "string", "template_string" }, -- Для JS/TS
        typescript = { "string", "template_string" },
      },
      disable_filetype = { "TelescopePrompt", "spectre_panel" }, -- Отключить в некоторых типах файлов
      fast_wrap = {
        map = "<M-e>", -- Быстрое оборачивание (Alt+e)
        chars = { "{", "[", "(", '"', "'" },
        pattern = [=[[%'%"%)%>%]%)%}%,]]=],
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
      },
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)
      -- Интеграция с nvim-cmp (если используешь)
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
    dependencies = { "hrsh7th/nvim-cmp" }, -- Если используешь nvim-cmp
  },
}
