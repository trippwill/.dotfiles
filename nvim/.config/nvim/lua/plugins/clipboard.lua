-- File: lua/plugins/clipboard.lua
return {
  'gbprod/yanky.nvim',
  -- keep default keys; just adjust options & clipboard provider
  opts = function(_, opts)
    opts = opts or {}
    opts.highlight = opts.highlight or { timer = 150 }
    -- prevent yanky from touching @+/@* in the background
    opts.system_clipboard = {
      sync_with_ring = false,
      sync_with_deletes = false,
      sync_with_unnamed = false,
    }
    return opts
  end,

  -- config = function(_, opts)
  --   require('yanky').setup(opts)
  --
  --   -- Always use system clipboard by default inside Neovim
  --   if not vim.list_contains(vim.opt.clipboard:get(), 'unnamedplus') then
  --     vim.opt.clipboard:append('unnamedplus')
  --   end
  --
  --   local function wl_paste_cmd(primary)
  --     local args = { 'wl-paste', '--no-newline' }
  --     if primary then
  --       table.insert(args, 2, '--primary')
  --     end
  --     return args
  --   end
  --
  --   local function safe_wl_paste(primary)
  --     return function()
  --       local out = vim.system(wl_paste_cmd(primary), { text = true, timeout = 1500 }):wait()
  --       if out and out.code == 0 and out.stdout then
  --         local text = out.stdout:gsub('\r\n', '\n')
  --         return { vim.split(text, '\n', { plain = true }), 'v' }
  --       end
  --       -- fallback: never blocks
  --       return { vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('') }
  --     end
  --   end
  --
  --   local function apply_clipboard_provider()
  --     -- disable auto OSC52 probing
  --     vim.g.termfeatures = vim.g.termfeatures or {}
  --     vim.g.termfeatures.osc52 = false
  --
  --     local in_ghostty = (vim.env.TERM_PROGRAM == 'ghostty')
  --     local on_wayland = (vim.env.WAYLAND_DISPLAY or '') ~= ''
  --     local has_wl = vim.fn.executable('wl-copy') == 1 and vim.fn.executable('wl-paste') == 1
  --
  --     if in_ghostty then
  --       -- Ghostty: OSC52 for COPY; wl-clipboard for PASTE (no OSC52 paste hangs)
  --       local osc52 = require('vim.ui.clipboard.osc52')
  --       vim.g.clipboard = {
  --         name = 'Ghostty (osc52 copy, wl-paste)',
  --         copy = {
  --           ['+'] = osc52.copy('+'),
  --           ['*'] = osc52.copy('*'),
  --         },
  --         paste = {
  --           ['+'] = osc52.paste('+'),
  --           ['*'] = osc52.paste('*'),
  --         },
  --         --cache_enabled = 0, -- avoid wl-paste spam/flicker
  --       }
  --     elseif on_wayland and has_wl then
  --       -- Non-Ghostty Wayland
  --       vim.g.clipboard = {
  --         name = 'wl-clipboard (Wayland)',
  --         copy = {
  --           ['+'] = 'wl-copy --type text/plain',
  --           ['*'] = 'wl-copy --primary --type text/plain',
  --         },
  --         paste = {
  --           ['+'] = safe_wl_paste(false),
  --           ['*'] = safe_wl_paste(true),
  --         },
  --         --cache_enabled = 0,
  --       }
  --     else
  --       -- Pure TTY / no wl-clipboard: leave g.clipboard unset
  --     end
  --   end
  --
  --   -- apply now
  --   -- apply_clipboard_provider()
  --
  --   -- apply again after lazy.nvim fires the VeryLazy user event
  --   vim.api.nvim_create_autocmd('User', {
  --     pattern = 'VeryLazy',
  --     once = true,
  --     callback = apply_clipboard_provider,
  --   })
  -- end,
}
