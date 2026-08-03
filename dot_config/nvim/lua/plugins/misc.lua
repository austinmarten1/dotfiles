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
      { "<leader>ao", desc = "Open opencode" },
    },
    config = function()
      require("toggleterm").setup({
        open_mapping = "<C-t>",
        direction = "vertical",
        size = 60,
        shell = vim.o.shell,
      })

      local Terminal = require("toggleterm.terminal").Terminal
      local opencode

      vim.keymap.set("n", "<leader>ao", function()
        local dir = vim.fn.expand("%:p:h")
        if vim.fn.isdirectory(dir) == 0 then
          dir = vim.uv.cwd() or vim.fn.getcwd()
        end
        if opencode and opencode:is_open() then
          opencode:close()
          return
        end
        opencode = Terminal:new({
          cmd = "opencode",
          dir = dir,
          direction = "vertical",
          close_on_exit = true,
        })
        opencode:open(80)
      end, { desc = "Open opencode" })
    end,
  },
}
