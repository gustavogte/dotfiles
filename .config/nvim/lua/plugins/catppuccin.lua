return {
  -- Other plugins
  {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      vim.g.catppuccin_flavour = "mocha" -- Set flavour to mocha
      require("catppuccin").setup()
      vim.cmd [[colorscheme catppuccin]]
    end,
  },
  -- Other plugins
}
