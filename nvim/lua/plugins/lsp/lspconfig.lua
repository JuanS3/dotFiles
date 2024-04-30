local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  return
end

local keymap = vim.keymap
local on_attach = function(client, bufnr)
  keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr })
  keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
  -- keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
  keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr })
  keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { buffer = bufnr })
  keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { buffer = bufnr })
  keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { buffer = bufnr })
  keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { buffer = bufnr })
  keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
  keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
  keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
  keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, { buffer = bufnr })
end


