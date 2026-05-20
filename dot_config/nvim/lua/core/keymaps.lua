vim.g.mapleader = " "

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Go to left window" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Go to lower window" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Go to upper window" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Go to right window" })

vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", {
  expr = true,
  silent = true,
})
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", {
  expr = true,
  silent = true,
})

vim.keymap.set("n", "<C-q>", "<C-v>", {
  desc = "Visual block mode",
})

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set({ "n", "v" }, "<C-S-l>", ">gv", {
  desc = "Indent right",
})
vim.keymap.set({ "n", "v" }, "<C-S-h>", "<gv", {
  desc = "Indent left",
})

vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>", {
  desc = "Toggle undotree",
})

vim.keymap.set("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end, {
  desc = "Find files",
})
vim.keymap.set("n", "<leader>fg", function()
  require("telescope.builtin").live_grep()
end, {
  desc = "Live grep",
})
vim.keymap.set("n", "<leader>fb", function()
  require("telescope.builtin").buffers()
end, {
  desc = "Find buffers",
})
vim.keymap.set("n", "<leader>fh", function()
  require("telescope.builtin").help_tags()
end, {
  desc = "Help tags",
})
vim.keymap.set("n", "<leader>fr", function()
  require("telescope.builtin").oldfiles()
end, {
  desc = "Recent files",
})

vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {
  desc = "Next diagnostic",
})
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {
  desc = "Prev diagnostic",
})

vim.keymap.set("n", "<leader>be", function()
  vim.fn.setreg("a", vim.fn.system('echo -n "' .. vim.fn.getreg("0") .. '" | base64'))
  print("Base64 encoded yank → register a")
end, {
  desc = "Base64 encode last yank",
})
