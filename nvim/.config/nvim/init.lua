require('vim._core.ui2').enable {}
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

if vim.g.vscode then
  require 'plugins.vscode'
  return
end

require 'core.keymaps'
require('lazy').setup {
  require 'plugins.lsp',
  require 'plugins.lualine',
  require 'plugins.colortheme',
  require 'plugins.treesitter',
  require 'plugins.telescope',
  require 'plugins.autocompletion',
  require 'plugins.formatter',
  require 'plugins.gitsigns',
  require 'plugins.fold',
  require 'plugins.auto-session',
  require 'plugins.oil',
  require 'plugins.mini',
  require 'plugins.misc',
}
