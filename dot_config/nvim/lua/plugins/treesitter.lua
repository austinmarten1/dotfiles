return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter").setup()

      require("nvim-treesitter").install({
        "c", "lua", "vim", "vimdoc", "query",
        "typescript", "javascript", "json", "yaml",
        "html", "css", "bash", "python", "go", "rust",
        "markdown", "markdown_inline", "toml", "ini", "sql",
        "java", "ruby", "perl", "php", "xml", "make", "nix", "dockerfile",
      })

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          if pcall(vim.treesitter.start, args.buf) then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
        desc = "Start treesitter highlighting when a parser is available",
      })
    end,
  },
}
