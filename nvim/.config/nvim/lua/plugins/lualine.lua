return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local mode = {
      'mode',
      separator = { right = '' },
      fmt = function(str)
        return ' ' .. str
      end,
    }

    local filename = {
      'filename',
      path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
      file_status = true, -- displays file status (readonly status, modified status)
      symbols = {
        modified = '[+]',
        readonly = '[-]',
        unnamed = '[No Name]',
        newfile = '[New]',
      },
    }

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end

    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      colored = false,
      update_in_insert = false,
      always_visible = false,
      cond = hide_in_width,
    }

    local diff = {
      'diff',
      colored = false,
      symbols = { added = '+', modified = '~', removed = '-' },
      cond = hide_in_width,
    }

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'lackluster',
        --     --
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { 'neo-tree', 'TelescopePrompt', 'oil' },
        globalstatus = false,
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { 'branch' },
        lualine_c = { filename },
        lualine_x = { diagnostics, diff },
        lualine_y = { { 'encoding', cond = hide_in_width } },
        lualine_z = { { 'location', separator = { left = ' ' } } },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 2 } },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { 'fugitive' },
    }
  end,
}
