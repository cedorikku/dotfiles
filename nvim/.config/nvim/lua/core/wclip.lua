if os.getenv 'SSH_CLIENT' then
  vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = require('vim.ui.clipboard.osc52').copy,
      ['*'] = require('vim.ui.clipboard.osc52').copy,
    },
    paste = {
      ['+'] = require('vim.ui.clipboard.osc52').paste,
      ['*'] = require('vim.ui.clipboard.osc52').paste,
    },
    cache_enabled = true,
  }
else
  vim.g.clipboard = {
    name = 'win32yank-wsl',
    copy = {
      ['+'] = 'win32yank.exe -i --crlf',
      ['*'] = 'win32yank.exe -i --crlf',
    },
    paste = {
      ['+'] = 'win32yank.exe -o --lf',
      ['*'] = 'win32yank.exe -o --lf',
    },
    cache_enabled = true,
  }
end
