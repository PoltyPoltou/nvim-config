-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby

local map = vim.keymap.set
-- local unmap = vim.keymap.del

map("n", "<C-P>", "<cmd>Telescope find_files<cr>")
map("n", "<A-P>", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>")
map({ "n", "t" }, "<Leader>t", "<cmd>ToggleTerm<cr>")
map("n", "<F2>", vim.lsp.buf.rename)
map("n", "<F11>", vim.lsp.buf.references)
map("n", "<F12>", vim.lsp.buf.definition)
map("n", "<Leader><Space>", vim.lsp.buf.code_action)
