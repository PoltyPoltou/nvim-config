-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby

local map = vim.keymap.set
-- local unmap = vim.keymap.del
local function map_on_plugin(plugin, mapping_fun)
  vim.api.nvim_create_autocmd({ "User" }, {
    pattern = "LazyLoad",
    callback = function(ev)
      if ev.data == plugin then
        mapping_fun()
      end
    end,
  })
end

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

map_on_plugin("nvim-dap", function()
  map(
    { "n", "v" },
    "<M-k>",
    'lua require("dapui").eval() | lua require("dapui").eval()',
    { desc = "Open and focus debug value" }
  )
end)
