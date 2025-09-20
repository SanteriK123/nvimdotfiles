local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Colorscheme
  require("plugins.tokyonight"),

  -- Lsp and completion related plugins
  "neovim/nvim-lspconfig",
  require("plugins.blink"),

  -- Visual plugins
  require("plugins.treesitter"),
  require("plugins.lualine"),
  require("plugins.colorizer"),

  -- Util
  require("plugins.guess-indent"),
  require("plugins.autotag"),
  require("plugins.autopairs"),
  require("plugins.telescope"),
  require("plugins.trouble"),
})
