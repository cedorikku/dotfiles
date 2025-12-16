-- Minimal config
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'no'
vim.opt.laststatus = 0
vim.opt.cmdheight = 1
vim.opt.showmode = false
vim.opt.ruler = false
vim.opt.showcmd = false

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. 'lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Theme and Oil
require('lazy').setup {
  require 'plugins.colortheme',
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ['<C-h>'] = false,
        ['<C-l>'] = false,
        ['<C-e>'] = 'actions.refresh',
        ['<C-s>'] = { 'actions.select', opts = { horizontal = true } },
        ['<C-t>'] = { 'actions.select', opts = { vertical = true } },
        ['<CR>'] = {
          function()
            local oil = require 'oil'
            local entry = oil.get_cursor_entry()
            local dir = oil.get_current_dir()

            if entry and entry.type == 'file' and dir then
              vim.fn.jobstart({ 'zeditor', dir .. entry.name }, { detach = true })
              vim.cmd 'qa!'
            else
              require('oil.actions').select.callback()
            end
          end,
        },
      },
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
}

-- Keymap
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', { noremap = true, silent = true })
