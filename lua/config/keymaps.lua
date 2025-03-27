-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--

local map = vim.keymap.set

vim.api.nvim_set_keymap("i", "<C-v>", "<C-r><C-o>+", { noremap = true, silent = true })

map("i", "jk", "<Esc>", { desc = "Esc" })

map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

map("n", "<leader>lm", ":TSToolsAddMissingImports<CR>", { desc = "Add Missing Imports" })
map("n", "<leader>la", ":TSToolsCodeAction<CR>", { desc = "Code Action" })
map("n", "<leader>lu", LazyVim.lsp.action["source.removeUnused.ts"], { desc = "Remove Unused" })

map("n", "gr", vim.lsp.buf.references, { desc = "References", nowait = true })

map({ "n", "v" }, "<leader>lf", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

-- buffers
map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

vim.keymap.del("n", "<leader>l")
vim.keymap.del("n", "<leader>E")
vim.keymap.del("n", "<leader>cd")

