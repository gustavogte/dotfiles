return {
  "opencode.nvim",
  name = "opencode",
  dir = vim.fn.stdpath("config") .. "/lua/opencode",
  config = function()
    local opencode = require("opencode")
    
    -- Set up keybindings
    vim.keymap.set("n", "<leader>oc", function()
      opencode.toggle()
    end, { desc = "Toggle OpenCode" })
    
    vim.keymap.set("n", "<leader>on", function()
      opencode.new_session()
    end, { desc = "New OpenCode session" })
    
    vim.keymap.set("n", "<leader>oo", function()
      opencode.focus()
    end, { desc = "Focus OpenCode session" })
    
    vim.keymap.set("n", "<leader>of", function()
      opencode.insert_file_ref()
    end, { desc = "Insert OpenCode file reference" })
    
    vim.keymap.set("v", "<leader>of", function()
      opencode.insert_file_ref(true)
    end, { desc = "Insert OpenCode file reference (selection)" })
    
    -- Set up commands
    vim.api.nvim_create_user_command("OpenCode", function()
      opencode.toggle()
    end, { desc = "Toggle OpenCode" })
    
    vim.api.nvim_create_user_command("OpenCodeNew", function()
      opencode.new_session()
    end, { desc = "New OpenCode session" })
    
    vim.api.nvim_create_user_command("OpenCodeFileRef", function(opts)
      local visual = opts.bang
      opencode.insert_file_ref(visual)
    end, { bang = true, desc = "Insert OpenCode file reference" })
  end,
}
