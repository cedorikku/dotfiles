return {
    'rmagatti/auto-session',
    lazy = false,
    keys = {
        { '<leader>wf', '<cmd>SessionSearch<CR>', { desc = 'Session picker' }},
        { '<leader>ws', '<cmd>SessionSave<CR>', { desc = 'Save session' }},
        { '<leader>wd', '<cmd>SessionDelete<CR>', { desc = 'Delete session' }},
    },

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
        enabled = true,
        lsp_stop_on_restore = true,
        suppressed_dirs = { '~/', '~/Downloads','~/Desktop', '~/Documents', '/' },
        -- log_level = 'debug',
    },
}
