require 'core.options'
require 'core.snippets'

-- if on Windows or WSL, load clipboard support
if vim.fn.has 'win32' == 1 or vim.fn.has 'wsl' == 1 then
  require 'core.wclip'
end

-- Lazy.nvim plugin manager
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. 'lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

vim.opt.rtp:prepend(lazypath)

if not vim.g.vscode then
  require 'core.keymaps'
  require('lazy').setup {
    require 'plugins.lsp',
    require 'plugins.lualine',
    require 'plugins.colortheme',
    require 'plugins.treesitter',
    require 'plugins.telescope',
    require 'plugins.autocompletion',
    require 'plugins.none-ls',
    require 'plugins.gitsigns',
    require 'plugins.indent-blankline',
    require 'plugins.fold',
    require 'plugins.misc',
    require 'plugins.auto-session',
    require 'plugins.oil',
    require 'plugins.roslyn',
  }
else
  require 'plugins.vscode'
  require('lazy').setup {
    require 'plugins.treesitter',
    { 'ggandor/flit.nvim' },
    { 'ggandor/leap.nvim' },
    { 'nvim-mini/mini.ai' },
    { 'nvim-mini/mini.comment' },
    { 'nvim-mini/mini.move' },
    { 'nvim-mini/mini.pairs' },
    {
      "kylechui/nvim-surround",
      version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup()
      end
    },
    { 'JoosepAlviste/nvim-ts-context-commentstring' },
    { 'tpope/vim-repeat' },
    { 'gbprod/yanky.nvim' },
  }
end
