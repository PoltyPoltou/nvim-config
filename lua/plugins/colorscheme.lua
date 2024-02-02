return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
  { "folke/tokyonight.nvim", opts = {
    style = "moon",
  } },
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "deep",
      highlights = {
        ["@comment"] = { fg = "#D63484", fmt = "italic" },
      },
    },
  },
}
