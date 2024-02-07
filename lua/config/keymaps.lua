-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby

local map = vim.keymap.set
-- local unmap = vim.keymap.del

map("n", "<C-P>", "<cmd>Telescope git_files<cr>", { remap = true })
map("n", "<A-P>", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>")
map("n", "<Leader>t", "<cmd>ToggleTerm<cr>")
map("t", "<ESC><ESC>", "<cmd>ToggleTerm<cr>")
-- for foot terminal and good behaved terminals
map("i", "<C-BS>", "<C-O>dvb")
-- default mapping of Konsole
map("i", "\b", "<C-O>dvb")
map("n", "<F2>", vim.lsp.buf.rename)
map("n", "<F11>", vim.lsp.buf.references)
map("n", "<F12>", vim.lsp.buf.definition)
map("n", "<Leader><Space>", vim.lsp.buf.code_action)
