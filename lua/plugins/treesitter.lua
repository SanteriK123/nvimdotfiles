return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "c", "cpp", "rust", "python", "zig", "go", "html", "css", "svelte", "javascript", "typescript", "lua", "markdown" , "tsx" },
      highlight = {
        enable = true,
      },
    })
  end
}

