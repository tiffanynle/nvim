return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = { transparent_background = true, float = { transparent = true, solid = false } },
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "catppuccin-mocha" },
  },
  {
    "folke/which-key.nvim",
    opts = { preset = "modern" },
  },
  { "nvim-tree/nvim-web-devicons", opts = {} },
  { "nvim-mini/mini.icons", version = false },
}
