local vscode = require 'vscode'
local keymap = vim.keymap.set

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- For conciseness
local opts = { noremap = true, silent = true }

-- Disable the spacebar key's default behavior in Normal and Visual modes
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- keymap('n', '<C-u>', function()
--   vscode.call 'vscode-neovim.ctrl-u'
--   vscode.call 'vscode-neovim.z'
-- end)

keymap('n', '<leader>v', function()
  vscode.action 'workbench.action.splitEditorRight'
end)

keymap('n', '<leader>h', function()
  vscode.action 'workbench.action.splitEditorDown'
end)

keymap('n', '<leader>sf', function()
  vscode.action 'workbench.action.quickOpen'
end)
keymap('n', '<leader>sg', function()
  vscode.action 'workbench.action.findInFiles'
end)

keymap('n', '<leader>p', function()
  vscode.call 'editor.action.formatDocument'
  vscode.notify 'Code formatted'
end)

keymap({ 'n', 'v' }, '<leader>t', function()
  vscode.action 'workbench.action.terminal.toggleTerminal'
end)
keymap({ 'n', 'v' }, '<leader>b', function()
  vscode.action 'editor.debug.action.toggleBreakpoint'
end)
keymap({ 'n', 'v' }, '<leader>d', function()
  vscode.call 'editor.action.showHover'
end)
keymap({ 'n', 'v' }, '<leader>q', function()
  vscode.action 'workbench.actions.view.problems'
end)

keymap({ 'n', 'v' }, '<C-j>', function()
  vscode.action 'workbench.action.navigateDown'
end)
keymap({ 'n', 'v' }, '<C-k>', function()
  vscode.action 'workbench.action.navigateUp'
end)
keymap({ 'n', 'v' }, '<C-h>', function()
  vscode.action 'workbench.action.navigateLeft'
end)
keymap({ 'n', 'v' }, '<C-l>', function()
  vscode.action 'workbench.action.navigateRight'
end)
