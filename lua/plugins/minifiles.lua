return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true, -- Закрыть, если это последнее окно
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        window = {
          position = "left",
          width = 30,
          mapping_options = {
            noremap = true,
            nowait = true,
          },
        },
        enable_cursor_hl = true,
        default_component_configs = {
          container = {
            enable_character_fade = true,
          },
        },
        filesystem = {
          follow_current_file = {
            enabled = true, -- Подсвечивать текущий файл
            leave_dirs_open = true, -- Оставлять директории открытыми
          },
          hijack_netrw_behavior = "open_default", -- Заменить Netrw
          use_libuv_file_watcher = true, -- Автообновление при изменении файлов
        },
        event_handlers = {
          -- Открытие Neotree с текущей директорией
          -- {
          -- 	event = "file_opened",
          -- 	handler = function()
          -- 		-- Закрыть Neotree после открытия файла
          -- 		require("neo-tree.command").execute({ action = "close" })
          -- 	end,
          -- },
        },
      })
      vim.api.nvim_set_hl(0, "NeoTreeCursorLine", {
        bg = "#3a3a3a", -- Цвет фона строки (замени на свой)
        bold = true, -- Жирный шрифт (опционально)
      })

      -- Привязка клавиш для открытия Neotree с текущим файлом
      vim.keymap.set("n", "<leader>e", function()
        require("neo-tree.command").execute({
          toggle = true,
          source = "filesystem",
          position = "left",
          reveal = true, -- Открыть с текущим файлом и директорией
        })
      end, { desc = "Toggle NeoTree with current file" })
    end,
  },
}
