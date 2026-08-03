return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")

      wk.setup({
        preset = "helix",
        layout = {
          align = "center",
          spacing = 10,
        },
      })

      wk.add({
        { "<leader>b", group = "base64" },
        { "<leader>c", group = "code" },
        { "<leader>f", group = "find" },
        { "<leader>h", group = "hunks" },
        { "<leader>r", group = "rename" },
        { "<leader>x", group = "diagnostics" },
        { "g",         group = "goto" },
      })
    end,
  },
}
