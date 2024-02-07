return {
  -- interference with sessions
  { "folke/persistence.nvim", enabled = false },
  {
    "natecraddock/workspaces.nvim",
    config = function()
      require("workspaces").setup({
        hooks = {
          open = function()
            vim.cmd("%bwipeout")
            require("sessions").load(nil, { silent = true })
          end,
          add = function()
            require("sessions").save(nil, { silent = true })
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
    lazy = false,
    config = function()
      require("sessions").setup({
        events = { "VimLeavePre" },
        session_filepath = vim.fn.stdpath("data") .. "/sessions",
        absolute = true,
      })
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    optional = true,
    opts = function(_, opts)
      local workspaces = {
        action = "Telescope workspaces",
        desc = " Projects",
        icon = " ",
        key = "p",
      }
      workspaces.desc = workspaces.desc .. string.rep(" ", 43 - #workspaces.desc)
      table.insert(opts.config.center, 3, workspaces)
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    optional = true,
    opts = function(_, opts)
      table.remove(opts.config.center, 7)
      local last_pwd = vim.g.LAST_CWD_USED
      if last_pwd ~= "" then
        local last_session = {
          action = "cd" .. last_pwd .. ' | lua require("sessions").load()',
          desc = " Restore Session at " .. last_pwd,
          icon = " ",
          key = "s",
        }
        last_session.desc = last_session.desc .. string.rep(" ", 43 - #last_session.desc)
        table.insert(opts.config.center, 7, last_session)
      end
    end,
  },
}
