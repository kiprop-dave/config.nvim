-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("i", "jk", "<esc>", opts) -- Insert mode -> jk -> Normal
keymap("n", "<tab>", ":bnext<cr>", opts) -- Next Tab
keymap("n", "<s-tab>", ":bprevious<cr>", opts)
keymap("t", "jk", "<C-\\><C-n>", opts)

vim.keymap.set("i", "<C-g>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })

-- keymap("i", '<tab', function () return vim.fn['codeium#Accept']() end, opts)
