local M = {}

-- Terminal management
local terminal_buf = nil
local terminal_win = nil

function M.toggle()
  if terminal_buf and vim.api.nvim_buf_is_valid(terminal_buf) then
    if vim.api.nvim_win_is_valid(terminal_win) then
      vim.api.nvim_win_close(terminal_win, true)
      terminal_win = nil
    else
      M.focus()
    end
  else
    M.new_session()
  end
end

function M.new_session()
  -- Close existing terminal if any
  if terminal_win and vim.api.nvim_win_is_valid(terminal_win) then
    vim.api.nvim_win_close(terminal_win, true)
  end
  
  -- Create new terminal
  vim.cmd("split")
  vim.cmd("terminal opencode")
  terminal_buf = vim.api.nvim_get_current_buf()
  terminal_win = vim.api.nvim_get_current_win()
  
  -- Set up terminal
  vim.cmd("startinsert")
  vim.bo.buflisted = false
  
  -- Set up terminal close behavior
  local autocmd = vim.api.nvim_create_autocmd("TermClose", {
    buffer = terminal_buf,
    callback = function()
      terminal_buf = nil
      terminal_win = nil
    end,
    once = true,
  })
end

function M.focus()
  if terminal_buf and vim.api.nvim_buf_is_valid(terminal_buf) then
    if not terminal_win or not vim.api.nvim_win_is_valid(terminal_win) then
      vim.cmd("split")
      vim.api.nvim_win_set_buf(0, terminal_buf)
      terminal_win = vim.api.nvim_get_current_win()
    end
    vim.api.nvim_set_current_win(terminal_win)
    vim.cmd("startinsert")
  else
    M.new_session()
  end
end

function M.insert_file_ref(visual)
  local buf = vim.api.nvim_get_current_buf()
  local file = vim.api.nvim_buf_get_name(buf)
  
  -- Get relative path from git root or current directory
  local relative_path = file
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel 2>/dev/null")[1]
  if git_root and git_root ~= "" then
    relative_path = file:gsub("^" .. git_root .. "/", "")
  end
  
  local ref = "@" .. relative_path
  
  if visual then
    -- Get selection range
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")
    ref = ref .. "#L" .. start_pos[2] .. "-L" .. end_pos[2]
  end
  
  -- Insert at cursor position
  local mode = vim.api.nvim_get_mode().mode
  if mode == "v" or mode == "V" or mode == "" then
    vim.cmd("normal! escape")
  end
  
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_text(buf, row - 1, col, row - 1, col, { ref })
end

function M.check_project()
  local agents_file = vim.fn.findfile("AGENTS.md", ".;")
  if agents_file ~= "" then
    vim.notify("OpenCode project detected (AGENTS.md found)", vim.log.levels.INFO)
    return true
  else
    vim.notify("No AGENTS.md found. Run /init in OpenCode to initialize project.", vim.log.levels.WARN)
    return false
  end
end

return M
