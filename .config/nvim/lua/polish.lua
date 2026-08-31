if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}

-- OpenCode integration
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    -- Check if we're in a git repository
    local git_root = vim.fn.systemlist("git rev-parse --show-toplevel 2>/dev/null")[1]
    if git_root and git_root ~= "" then
      -- Check for AGENTS.md file
      local agents_file = git_root .. "/AGENTS.md"
      if vim.fn.filereadable(agents_file) == 1 then
        -- Set up OpenCode terminal keybindings in terminal mode
        vim.keymap.set("t", "<C-E>", "<Cmd>OpenCode<CR>", { buffer = true, desc = "OpenCode toggle" })
      end
    end
  end,
  once = true,
})

-- Terminal configuration for OpenCode
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    -- Set up terminal escape sequences for OpenCode IDE shortcuts
    vim.keymap.set("t", "<M-C-E>", "<C-\\><C-n><Cmd>OpenCode<CR>i", { buffer = true, desc = "OpenCode quick launch" })
    vim.keymap.set("t", "<M-C-S-E>", "<C-\\><C-n><Cmd>OpenCodeNew<CR>i", { buffer = true, desc = "OpenCode new session" })
  end,
})
