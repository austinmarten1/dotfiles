return {
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<C-t>", desc = "Toggle terminal" },
    },
    config = function()
      require("toggleterm").setup({
        open_mapping = "<C-t>",
        direction = "vertical",
        size = 60,
        shell = vim.o.shell,
      })
    end,
  },
}
