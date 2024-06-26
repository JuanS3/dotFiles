vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<C-b>f", ":NvimTreeFindFile<CR>")
vim.keymap.set("n", "<C-b>r", ":NvimTreeRefresh<CR>")

-- close nvim-tree on last buffer


vim.cmd([[ autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif ]]) -- close nvim-tree on last buffer

-- open nvim-tree on startup
-- vim.cmd("autocmd VimEnter * NvimTreeToggle")

