local ok, null_ls = pcall(require, "null-ls")

if not ok then
  return
end

null_ls.setup({

  sources = {
    null_ls.builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ ".eslintrc", ".eslintrc.json" })
      end,
    }),
  },

})

