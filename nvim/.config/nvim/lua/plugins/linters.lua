return {
  {
    'mfussenegger/nvim-lint',
    optional = true,
    opts = {
      linters = {
        ['markdownlint-cli2'] = {
          args = { '--config', vim.fn.expand('~') .. '/.markdownlint-cli2.jsonc', '--' },
        },
      },
      linters_by_ft = {
        zsh = { 'shellcheck' },
      },
    },
  },
}
