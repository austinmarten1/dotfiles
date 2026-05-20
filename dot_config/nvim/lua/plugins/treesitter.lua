return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = {
        "c", "lua", "vim", "vimdoc", "query",
        "typescript", "javascript", "json", "yaml",
        "html", "css", "bash", "python", "go", "rust",
        "markdown", "toml", "ini", "sql", "java", "ruby",
        "perl", "php", "xml", "make", "nix", "dockerfile"
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}
