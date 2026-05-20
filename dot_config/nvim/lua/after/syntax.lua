local M = {}

vim.api.nvim_create_user_command("FixHighlighting", function()
  local ft = vim.bo.filetype
  vim.cmd("syntax clear")
  vim.cmd("syntax reset")
  vim.cmd("syntax enable")
  vim.cmd("syntax sync fromstart")
  vim.bo.filetype = ft
  vim.cmd("redraw!")
end, {})

return M
