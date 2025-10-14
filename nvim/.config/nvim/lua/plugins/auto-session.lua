return {
  'rmagatti/auto-session',
  lazy = false,
  keys = {
    { '<leader>wf', '<cmd>AutoSession search<CR>', { desc = 'Session picker' } },
    { '<leader>ws', '<cmd>AutoSession save<CR>', { desc = 'Save session' } },
    { '<leader>wd', '<cmd>AutoSession delete<CR>', { desc = 'Delete session' } },
    { '<leader>wt', '<cmd>AutoSession toggle<CR>', { desc = 'Session autosave toggle' } },
    { '<leader>wr', '<cmd>AutoSession restore<CR>', { desc = 'Session restore on cwd (manual)' } },
  },

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    enabled = true,
    lsp_stop_on_restore = true,
    suppressed_dirs = { '~/', '~/Downloads', '~/Desktop', '~/Documents', '/' },
  },
}
