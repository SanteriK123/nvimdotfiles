function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map("n", shortcut, command)
end

function imap(shortcut, command)
  map("i", shortcut, command)
end

vim.g.mapleader = ","
vim.g.maplocalleader = ","

nmap("<leader>ff", '<cmd>lua require("telescope.builtin").find_files()<cr>')
nmap("<leader>fg", '<cmd>lua require("telescope.builtin").live_grep()<cr>')
nmap("<leader>fb", '<cmd>lua require("telescope.builtin").buffers()<cr>')
nmap("<leader>fh", '<cmd>lua require("telescope.builtin").help_tags()<cr>')

nmap("<leader>xx", "<cmd>Trouble diagnostics toggle<cr>")
nmap("<leader>xq", "<cmd>Trouble qflist toggle<cr>")
nmap("<leader>xl", "<cmd>trouble loclist toggle<cr>")
nmap("<leader>cl", "<cmd>trouble lsp toggle<cr>")

-- Movement
nmap("å", "{")
nmap("ö", "}")
nmap("+", "$")

-- Selection
nmap("<leader>a", "ggVG") -- Select all
nmap("<leader>r", ":%s///g<LEFT><LEFT>") -- quick SED
