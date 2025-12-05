-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.root_spec = { '*.slnx', 'lsp', { '.git', 'lua' }, 'cwd' }
vim.g.ai_cmp = true
vim.o.statuscolumn = [[%!v:lua.require'modechar'.get('gutter') .. v:lua.require'snacks.statuscolumn'.get()]]
vim.o.winborder = 'rounded'
