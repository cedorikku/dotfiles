return {
  'stevearc/conform.nvim',
  config = function()
    require('conform').setup {
      notify_on_error = false,
      default_format_opts = {
        lsp_format = 'fallback',
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff' },
        css = { 'oxfmt', 'prettier' },
        html = { 'oxfmt', 'prettier' },
        json = { 'oxfmt', 'prettier' },
        yaml = { 'oxfmt', 'prettier' },
        javascript = { 'oxfmt', 'prettier' },
        typescript = { 'oxfmt', 'prettier' },
        javascriptreact = { 'oxfmt', 'prettier' },
        typescriptreact = { 'oxfmt', 'prettier' },
        markdown = { 'oxfmt', 'prettier' },
        sh = { 'shfmt' },
        make = { 'checkmake' },
      },
    }

    vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
      require('conform').format { async = true, lsp_format = 'fallback' }
    end, { noremap = true, silent = true, desc = 'Format buffer' })
  end,
}
