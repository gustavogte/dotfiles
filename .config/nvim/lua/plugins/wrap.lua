-- Basic settings
vim.o.wrap = true
vim.o.breakindent = true
vim.o.showbreak = '↳ '  -- Or any symbol you prefer

-- Plugin setup using Lazy.nvim
return {
  -- Other plugins
  {
    'mg979/vim-visual-multi',
    branch = 'master',
    config = function()
      -- Plugin specific configuration can go here
    end
  },
  {
    'machakann/vim-sandwich',
    config = function()
      -- Plugin specific configuration can go here
    end
  },
  -- Other plugins
}
