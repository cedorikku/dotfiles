return {
  'yousefhadder/markdown-plus.nvim',
  ft = 'markdown',
  opts = {
    enabled = true,
    features = {
      list_management = true,
      text_formatting = true,
      thematic_break = false,
      headers_toc = true,
      links = true,
      images = true,
      quotes = true,
      callouts = true,
      code_block = false,
      html_block_awareness = true,
      table = true,
      footnotes = true,
    },
    footnotes = {
      section_header = 'Footnotes', -- Header for footnotes section
      confirm_delete = true, -- Confirm before deleting footnotes
    },
    keymaps = {
      enabled = true,
    },
    toc = { -- TOC window config
      initial_depth = 2,
    },
    callouts = {
      default_type = 'NOTE',
      custom_types = {}, -- 'INFO', 'WARNING', 'SUCCESS'
    },
    table = { -- Table sub-configuration
      auto_format = true,
      default_alignment = 'left',
      confirm_destructive = true, -- Confirm before transpose/sort operations
      keymaps = {
        enabled = true,
        prefix = '<localleader>t',
        insert_mode_navigation = true, -- Alt+hjkl cell navigation
      },
    },
  },
}
