-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Storing the last pwd before exiting vim
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    vim.fn.writefile({ vim.fn.getcwd() }, vim.fn.stdpath("data") .. "/last_cwd")
  end,
})

vim.api.nvim_create_autocmd("DirChanged", {
  pattern = "global",
  callback = function()
    require("sessions").load(nil, { silent = true })
  end,
})
