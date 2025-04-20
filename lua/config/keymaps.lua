-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--

local map = vim.keymap.set

vim.api.nvim_set_keymap("i", "<C-v>", "<C-r><C-o>+", { noremap = true, silent = true })

map("i", "jk", "<Esc>", { desc = "Esc" })

map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

map("n", "<leader>e", function()
  vim.cmd("Neotree reveal")
end, { desc = "Neotree (left)" })

map("n", "<leader>lm", ":TSToolsAddMissingImports<CR>", { desc = "Add Missing Imports" })
map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>lu", LazyVim.lsp.action["source.removeUnused.ts"], { desc = "Remove Unused" })
map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" })
map({ "n", "v" }, "<leader>lf", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format" })

local telescope = require("telescope.builtin")

vim.keymap.set("n", "gr", function()
  telescope.lsp_references({
    -- Обработка результатов
    entry_maker = function(entry)
      return {
        value = entry,
        display = string.format("%s:%d - %s", entry.filename, entry.lnum, entry.text),
        ordinal = entry.filename .. ":" .. entry.lnum, -- Для сортировки
        filename = entry.filename,
        lnum = entry.lnum,
        col = entry.col,
      }
    end,
    -- Фильтрация и сортировка
    results_processor = function(results)
      local filtered = {}
      local seen = {}
      for _, result in ipairs(results) do
        local key = result.filename .. ":" .. result.lnum .. ":" .. result.col
        if not seen[key] then
          table.insert(filtered, result)
          seen[key] = true
        end
      end
      -- Сортировка по имени файла
      table.sort(filtered, function(a, b)
        return a.filename < b.filename
      end)
      return filtered
    end,
    -- Дополнительные настройки отображения
    layout_strategy = "vertical",
    layout_config = {
      prompt_position = "top",
      height = 0.8,
      width = 0.8,
    },
  })
end, { noremap = true, silent = true, desc = "References" })

vim.keymap.set("n", "gd", function()
  telescope.lsp_definitions({})
end, { noremap = true, silent = true, desc = "Definitions" })

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- buffers
map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

map("n", "<leader>rp", ':%s/\\<<C-r><C-w>\\>/<C-r>"/g<CR>', { noremap = true, desc = "Replace all" })
map("v", "<leader>p", '"_dP', { noremap = true, silent = true, desc = "Paste without yank" })

vim.keymap.del("n", "<leader>l")
vim.keymap.del("n", "<leader>E")
vim.keymap.del("n", "<leader>cd")
