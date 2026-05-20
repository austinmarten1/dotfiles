return {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = { "/usr/share/nvim/runtime/lua" },
        checkThirdParty = false,
      },
    },
  },
}
