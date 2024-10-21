-- Highlight the symbol when holding the cursor if you need it
vim.g.easycomplete_cursor_word_hl = 1
-- Using nerdfont is highly recommended
vim.g.easycomplete_nerd_font = 1

-- GoTo code navigation
vim.keymap.set('n', 'gr', ':EasyCompleteReference<CR>')
vim.keymap.set('n', 'gd', ':EasyCompleteGotoDefinition<CR>')
vim.keymap.set('n', 'rn', ':EasyCompleteRename<CR>')
vim.keymap.set('n', 'gb', ':BackToOriginalBuffer<CR>')
