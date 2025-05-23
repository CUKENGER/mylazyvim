-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = false

vim.opt.cursorline = true

-- Mouse
vim.opt.mouse = "a"
vim.opt.mousefocus = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Indent Settings
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Other
vim.opt.scrolloff = 8
-- vim.opt.wrap = false
--
vim.opt.showtabline = 2

vim.opt.termguicolors = true

vim.api.nvim_set_hl(0, "Normal", { bg = "#120E27" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#0E0A23" })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#6B7280", bg = "none" })
