return {
  { "vim-scripts/ReplaceWithRegister" },
  { "akinsho/toggleterm.nvim", version = "*", config = true },
  {
    "natecraddock/workspaces.nvim",
    config = function()
      require("workspaces").setup({
        hooks = {
          open = function()
            vim.cmd("%bwipeout")
            require("sessions").load(nil, { silent = true })
          end,
        },
      })
      require("telescope").load_extension("workspaces")
    end,
    keys = {
      { "<Leader>fp", "<cmd>Telescope workspaces<CR>", desc = "workspaces" },
    },
  },
  {
    "natecraddock/sessions.nvim",
    config = function()
      require("sessions").setup({
        events = { "VimLeavePre" },
        session_filepath = vim.fn.stdpath("data") .. "/sessions",
        absolute = true,
      })
    end,
    event = "DirChanged",
  },
  -- interference with sessions
  { "folke/persistence.nvim", enabled = false },
}
