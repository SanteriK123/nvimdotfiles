-- Set colorscheme
require("tokyonight").setup({
  style = "moon",
  styles = {
    keywords = { italic = false },
  }
})

vim.cmd[[colorscheme tokyonight]]

-- Treesitter config
require("nvim-treesitter.configs").setup({
  ensure_installed = { "c", "cpp", "rust", "python", "zig", "go", "html", "css", "svelte", "javascript", "typescript", "lua", "markdown" },
  highlight = {
    enable = true,
  },

  -- Enable nvim-ts-autotag
  autotag = {
    enable = true,
  },
})

require("colorizer").setup()
require("nvim-autopairs").setup()

