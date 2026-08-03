local M = {}

local opt = vim.opt
local g = vim.g

if vim.fn.has("linux") == 1 then
  g.clipboard = {
    name = "copyq",
    copy = {
      ["+"] = "copyq copy -",
      ["*"] = "copyq copy -",
    },
    paste = {
      ["+"] = "copyq clipboard",
      ["*"] = "copyq clipboard",
    },
    cache_enabled = 1,
  }
elseif vim.fn.has("mac") == 1 then
  opt.clipboard = "unnamedplus"
else
  opt.clipboard = "unnamedplus"
end

opt.updatetime = 1000
opt.termguicolors = true
opt.background = "dark"
opt.conceallevel = 2
opt.maxmempattern = 100000
opt.redrawtime = 10000
opt.rdt = 0

opt.backup = true
opt.undofile = true
opt.backupdir = vim.fn.expand("~/.config/nvim/backup//")
opt.directory = vim.fn.expand("~/.config/nvim/swap//")
opt.undodir = vim.fn.expand("~/.config/nvim/undo//")

local secret_patterns = {
  "*.tfvars",
  "*.tfvars.json",
  "*.tfstate",
  "*.tfstate.*",
  "*.env",
  ".env",
  ".env.*",
  "*.pem",
  "*.key",
  "*.p12",
  "*.pfx",
  "id_rsa",
  "id_ed25519",
  "*secret*",
  "*credential*",
  ".netrc",
  ".pgpass",
  "*.kubeconfig",
  "kubeconfig",
  "secrets.zsh",
}

opt.backupskip:append(secret_patterns)

vim.api.nvim_create_autocmd({
  "BufReadPre",
  "BufNewFile",
}, {
  pattern = secret_patterns,
  callback = function()
    vim.opt_local.backup = false
    vim.opt_local.writebackup = false
    vim.opt_local.swapfile = false
    vim.opt_local.undofile = false
    vim.opt_local.shada = ""
  end,
  desc = "Disable on-disk persistence for secret-bearing files",
})

opt.smartindent = true
opt.shiftwidth = 4
opt.expandtab = true
opt.tabstop = 4
opt.smarttab = true
opt.listchars = { tab = ">-", trail = "-", nbsp = "_" }
opt.list = true
opt.spell = true
opt.whichwrap:append("<,>,h,l,[,]")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "yaml",
  command = "setlocal ts=2 sts=2 sw=2 expandtab",
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = ":%s/\\s\\+$//e",
})

vim.api.nvim_create_user_command("Rmspace", function()
  vim.cmd(":%s/\\s\\+$//e")
  print("Trailing whitespace removed")
end, { desc = "Remove trailing whitespace from current buffer" })

g.VM_maps = {
  ["Select Cursor Down"] = "<C-j>",
  ["Select Cursor Up"] = "<C-k>",
}

g.go_version_warning = 0
g.go_imports_autosave = 1

g.undotree_SetFocusWhenToggle = 1
g.undotree_WindowLayout = 2
g.undotree_HighlightChangedWithSignColumn = 1

local ok, _ = pcall(vim.cmd, "colorscheme catppuccin")
if not ok then
  vim.cmd("colorscheme default")
end

if vim.fn.exists("$TMUX") == 1 or vim.fn.exists("$TERM_PROGRAM") == 1 then
  vim.cmd("set t_Co=256")
end

return M
