return {
  "folke/tokyonight.nvim",
  config = function()
    require("tokyonight").setup({
      style = "moon",
      styles = {
        keywords = { italic = false },
      }
    })

    vim.cmd[[colorscheme tokyonight]]
  end
}

