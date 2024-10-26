-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in Normal and Visual mode
vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', {silent = true})
