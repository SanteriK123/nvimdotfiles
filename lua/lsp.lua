-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

on_attach = function(client, bufnr)
  --client.server_capabilities.semanticTokensProvider = nil
  -- if client.server_capabilities.inlayHintProvider then
  --   vim.lsp.inlay_hint.enable(buf, true)
  -- end
end

-- LSP setups
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp = require("lspconfig")

lsp.rust_analyzer.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lsp.pyright.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lsp.clangd.setup({
  cmd = { "clangd", "--completion-style=detailed" },
  capabilities = capabilities,
  on_attach = on_attach,
})
lsp.gopls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lsp.ts_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lsp.svelte.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lsp.html.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lsp.omnisharp.setup({
  cmd = { "omnisharp" },
  capabilities = capabilities,
  on_attach = on_attach,
})
lsp.tinymist.setup({
  settings = {
    exportPdf = "onSave"
  },
  capabilities = capabilities,
  on_attach = on_attach,
})

lsp.gdscript.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
