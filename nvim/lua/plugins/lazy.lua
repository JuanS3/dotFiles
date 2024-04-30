-- Install lazylazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup(
  {
    -- Theme
    {
      'dracula/vim', as = 'dracula',
      config = function()
        vim.cmd[[colorscheme dracula]]
        vim.cmd[[set background=dark]]
      end
    },

    -- Statusline
    { 'nvim-lualine/lualine.nvim' },

    -- Autocompletion
    { 'Exafunction/codeium.vim', as = 'codeium' },

    -- Markdown preview
    {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle" },
      ft = { "markdown" },
      build = function() vim.fn["mkdp#util#install"]() end,
    },

    -- Fancier statusline
    { 'nvim-lualine/lualine.nvim' }, -- statusline with icons and lsp status in lua

    -- Fuzzy Finder (files, lsp, etc)
    {
      'nvim-telescope/telescope.nvim',
      branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    }, -- fuzzy finder for files and lsp results
    { 'nvim-telescope/telescope-symbols.nvim' }, -- symbols in Telescope finder

    -- Slidebar
    { 'nvim-tree/nvim-tree.lua' }, -- file explorer tree view
    { 'nvim-tree/nvim-web-devicons' }, -- optional, for file icons

    -- tree-sitter syntax
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' }, -- syntax highlighting
    { 'nvim-treesitter/nvim-treesitter-context' }, -- show context

    -- LSP
    { 'neovim/nvim-lspconfig' }, -- enable LSP
    { 'williamboman/mason.nvim' }, -- simple to use language server installer
    { 'williamboman/mason-lspconfig.nvim' }, -- simple to use language server installer
    { 'glepnir/lspsaga.nvim', branch = 'main' }, -- LSP UI
    { 'jose-elias-alvarez/null-ls.nvim' }, -- for formatters and linters
    { 'onsails/lspkind.nvim' }, -- LSP icons

    -- Cmp
    { 'hrsh7th/nvim-cmp' }, -- completion plugin
    { 'hrsh7th/cmp-nvim-lsp' }, -- LSP source for nvim-cmp
    { 'saadparwaiz1/cmp_luasnip' }, -- Snippets source for nvim-cmp
    { 'L3MON4D3/LuaSnip' }, -- Snippets plugin

    -- LSP Zero
    { 'VonHeikemen/lsp-zero.nvim' },

    -- Python LSP
    { 'VonHeikemen/lsp-zero.nvim' },

    -- Autopairs
    { 'windwp/nvim-autopairs' }, -- Autopairs, integrates with both cmp and treesitter

    -- Comments
    { 'terrortylor/nvim-comment' }, -- comments in lua

    -- Git
    { 'lewis6991/gitsigns.nvim' }, -- show git diff in gutter signs and stages hunks with <leader>hs and <leader>hu

    -- Keymaps
    { 'folke/which-key.nvim' }, -- keymaps helper for nvim config files

    -- Autosave
    { 'Pocco81/auto-save.nvim' }, -- autosave on focus lost and on buffer write

    -- Python
    { 'Vimjas/vim-python-pep8-indent' }, -- indent for python files

    -- HTML
    { 'mattn/emmet-vim' }, -- emmet for vim

    -- Tmux
    { 'christoomey/vim-tmux-navigator' }, -- tmux integration
  }
)
