vim.api.nvim_create_autocmd({ "User" }, {
  pattern = "SessionLoadPost",
  callback = function()
    require("neo-tree.command").execute({
      action = "show", -- OPTIONAL, this is the default value
      source = "filesystem", -- OPTIONAL, this is the default value
    })
  end,
})

return {
  -- interference with sessions
  { "folke/persistence.nvim", enabled = false },
  {
    "Shatur/neovim-session-manager",
    lazy = false,

    opts = {
      autoload_mode = "Disabled",
      autosave_last_session = true,
      autosave_ignore_not_normal = true,
      autosave_ignore_dirs = {},
      autosave_ignore_filetypes = {
        "gitcommit",
        "gitrebase",
      },
      autosave_ignore_buftypes = {},
      autosave_only_in_session = false,
      max_path_length = 100,
    },
    keys = {
      { "<Leader>qs", "<cmd>SessionManager load_session<CR>", desc = "Browse Sessions" },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    optional = true,
    lazy = false,
  },
  {
    "natecraddock/workspaces.nvim",
    config = function()
      require("workspaces").setup({
        hooks = {
          open = function()
            vim.cmd("%bwipeout")
            vim.cmd("SessionManager load_current_dir_session")
          end,
          add = function()
            vim.cmd("SessionManager save_current_session")
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
          action = "SessionManager load_last_session",
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
