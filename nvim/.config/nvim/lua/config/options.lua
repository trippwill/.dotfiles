-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.ai_cmp = true
vim.o.statuscolumn = [[%!v:lua.require'guttermode'.get() .. v:lua.require'snacks.statuscolumn'.get()]]
