vim.g.mapleader = " "
require("config.lazy")
require("core.options")
require("core.keymaps")
require("lazy").setup("plugins", {
  change_detection = {
    notify = false
  },
})
