local ok, mason = pcall(require, "mason")
if not ok then
  return
end

mason.setup()

local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok then
  return
end

mason_lspconfig.setup({
  ensure_installed = {
    "pyright",
    "rust_analyzer",
    "tsserver",
    "lua_ls",
    "jsonls",
    "yamlls",
    "dockerls",
    "clangd",
    "bashls",
    "html",
    "cssls",
    "marksman",
    "ltex",
    "sqlls",
  }
})

mason_lspconfig.setup_handlers({
  function (server_name)
    require("lspconfig")[server_name].setup({})
  end
})

local ok, mason_null_ls = pcall(require, "mason-null-ls")
if not ok then
  return
end


mason_null_ls.setup()
