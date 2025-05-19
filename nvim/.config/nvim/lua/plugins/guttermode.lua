return {
  ---@module 'modechar'
  {
    'trippwill/modechar.nvim',
    dev = false,
    name = 'modechar.nvim',
    module = 'modechar',
    -- lazy = false,
    ---@type ModeCharOptions
    opts = {
      chars = {
        gutter = { '▌', highlight = 'ModeCharGutter', clear_hl = true, buftype = { '', 'nofile' } },
        arrow = { '▶', highlight = 'ModeCharArrow' },
      },
      debug = false,
      modahl_opts = {
        highlights = {
          {
            'ModeCharGutter',
            adapter = 'lualine-invert',
          },
          {
            'ModeCharArrow',
            adapter = 'debug',
            links = { 'CursorColumn' },
          },
        },
        debug = false,
      },
    },
  },
}
