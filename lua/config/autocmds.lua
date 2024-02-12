-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Storing the last pwd before exiting vim
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    vim.g.LAST_CWD_USED = vim.fn.getcwd()
  end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function(ev)
    if vim.bo[ev.buf].buftype == "help" then
      vim.api.nvim_buf_call(ev.buf, function()
        vim.cmd("wincmd L")
        vim.cmd("vertical resize 95")
      end)
    end
  end,
})
