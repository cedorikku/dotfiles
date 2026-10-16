return {
  'stevearc/oil.nvim',
  opts = {
    default_file_explorer = true,
    columns = { "size", "mtime", "icon" },
    view_options = {
      show_hidden = true,
    },
    watch_for_changes = true,
    keymaps = {
      ["<C-e>"] = "actions.refresh",
      ["<C-s>"] = { "actions.select", opts = { horizontal = true } },
      ["<C-t>"] = { "actions.select", opts = { vertical = true } },
    },
    win_options = {
      winbar = "%#Directory#%{v:lua.require('oil').get_current_dir()}",
    },
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
