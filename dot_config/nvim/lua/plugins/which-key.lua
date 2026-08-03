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
        { "<leader>f",  group = "find" },
        { "<leader>h",  group = "hunks" },
        { "<leader>x", group = "diagnostics" },
        { "<leader>c", group = "code" },
        { "<leader>r", group = "rename" },
        { "<leader>b", group = "buffer" },
        { "g",         group = "goto" },

        { "<leader>e", desc = "Toggle file explorer" },
        { "<leader>u", desc = "Toggle undotree" },

        { "<leader>ff", desc = "Find files" },
        { "<leader>fg", desc = "Live grep" },
        { "<leader>fb", desc = "Find buffers" },
        { "<leader>fh", desc = "Help tags" },
        { "<leader>fr", desc = "Recent files" },

        { "<leader>xx", desc = "Toggle diagnostics" },
        { "<leader>xX", desc = "Buffer diagnostics" },

        { "<leader>ca", desc = "Code action" },
        { "<leader>cf", desc = "Format buffer", mode = { "n", "v" } },
        { "<leader>rn", desc = "Rename symbol" },
        { "gd",         desc = "Go to definition" },
        { "gr",         desc = "Go to references" },
        { "K",          desc = "Hover docs" },

        { "]d", desc = "Next diagnostic" },
        { "[d", desc = "Prev diagnostic" },

        { "]h",          desc = "Next hunk" },
        { "[h",          desc = "Prev hunk" },
        { "<leader>hs",  desc = "Stage hunk" },
        { "<leader>hu",  desc = "Unstage hunk" },
        { "<leader>hr",  desc = "Reset hunk" },
        { "<leader>hp",  desc = "Preview hunk" },
        { "<leader>hb",  desc = "Blame line" },

        { "<C-t>",       desc = "Toggle terminal" },
        { "<leader>be", desc = "Base64 encode yank" },
      })
    end,
  },
}
