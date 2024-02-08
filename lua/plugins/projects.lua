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
      -- save the latest session too
      vim.api.nvim_create_autocmd("VimLeavePre", {
        callback = function()
          require("sessions").save(vim.fn.stdpath("data") .. "/sessions/last.session", {})
        end,
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
        key_format = "  %s",
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
          action = "SessionsLoad " .. vim.fn.stdpath("data") .. "/sessions/last.session",
          desc = " Restore Session at " .. last_pwd,
          icon = " ",
          key = "s",
          key_format = "  %s",
        }
        last_session.desc = last_session.desc .. string.rep(" ", 43 - #last_session.desc)
        table.insert(opts.config.center, 7, last_session)
      end
    end,
  },
}
