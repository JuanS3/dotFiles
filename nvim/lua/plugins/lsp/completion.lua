local cmp = require("cmp")

cmp.setup({

  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),

  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  })

})

cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

require("lsp-zero.cmp").extend()

local ok, lspkind = pcall(require, "lspkind")
if not ok then
  return
end

lspkind.init()

require("lspconfig.ui.windows").default_options.border = "single"

local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok then
  return
end

cmp_nvim_lsp.setup()

local ok, lspsaga = pcall(require, "lspsaga")
if not ok then
  return
end

lspsaga.setup()

require("lspconfig.ui.windows").default_options.border = "single"

