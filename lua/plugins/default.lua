-- default file for config
-- lot of things are not yet mature or big enough to go in a specific file

vim.api.nvim_create_autocmd({ "User" }, {
  pattern = "LazyLoad",
  callback = function(ev)
    if ev.data == "nvim-dap" then
      local dap = require("dap")
      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "-i", "dap" },
      }
    end
  end,
})

return {
  { "vim-scripts/ReplaceWithRegister" },
  { "akinsho/toggleterm.nvim", version = "*", config = true },
  { "folke/neodev.nvim", opts = { library = { plugins = { "nvim-dap-ui" }, types = true } } },
  {
    "rcarriga/nvim-dap-ui",
    opts = {
      layouts = {
        {
          elements = {
            {
              id = "scopes",
              size = 0.25,
            },
            {
              id = "breakpoints",
              size = 0.25,
            },
            {
              id = "stacks",
              size = 0.25,
            },
            {
              id = "watches",
              size = 0.25,
            },
          },
          position = "right",
          size = 0.25,
        },
        {
          elements = {
            {
              id = "repl",
              size = 0.5,
            },
            {
              id = "console",
              size = 0.5,
            },
          },
          position = "bottom",
          size = 20,
        },
      },
      mappings = {
        edit = "e",
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        repl = "r",
        toggle = "t",
      },
      render = {
        indent = 1,
        max_value_lines = 100,
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      local filter = function(buf_num, _)
        if vim.fn.bufname(buf_num) == "*cmake-tools*" then
          return false
        end
        return true
      end
      opts.options.custom_filter = filter
    end,
  },
}
