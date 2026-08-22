return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter-textobjects', branch = 'main' },
  },
  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = '*',
      callback = function()
        -- Enable treesitter highlighting
        pcall(vim.treesitter.start)

        -- Enable treesitter-based indentation
        local excluded_ft = { 'cs' }
        if not vim.tbl_contains(excluded_ft, vim.bo.filetype) then
          vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
        end
      end,
    })

    local parsers = {
      'html',
      'javascript',
      'css',
      'typescript',
      'tsx',
      'json',
      'toml',
      'bash',
      'c',
      'diff',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'vim',
      'vimdoc',
      'c_sharp',
    }

    require('nvim-treesitter').install(parsers)
  end,
}
