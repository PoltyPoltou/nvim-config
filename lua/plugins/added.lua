return {
  { "vim-scripts/ReplaceWithRegister" },
  { "akinsho/toggleterm.nvim", version = "*", config = true, opts = {
    persist_size = false,
  } },
  -- {
  --   "folke/edgy.nvim",
  --   opts = {
  --     bottom = {
  --       size = { height = 0.8 },
  --     },
  --   },
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
  { "folke/tokyonight.nvim", opts = {
    style = "moon",
  } },
  { "navarasu/onedark.nvim", opts = {
    style = "deep",
  } },
}
