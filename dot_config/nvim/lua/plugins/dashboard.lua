return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup({
        theme = "hyper",
        config = {
          week_header = { enable = true },
          packages = { enable = true },
          project = { enable = true, limit = 8 },
        },
      })
    end,
  },
}

