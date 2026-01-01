return {
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local status_ok, alpha = pcall(require, 'alpha')
      if not status_ok then
        return
      end

      local dashboard = require 'alpha.themes.dashboard'

      local cats = {
        {
          '    |\\__/,|   (`\\',
          '  _.|o o  |_   ) )',
          '-(((---(((--------',
        },
        {
          ' _._     _,-\'""`-._',
          "(,-.`._,'(       |\\`-/|",
          "    `-.-' \\ )-`( , o o)",
          '          `-    \\`"\'-',
        },
        {
          'ᓚ₍ ^. .^₎',
        },
      }

      math.randomseed(os.time())
      local chosen_cat = cats[math.random(#cats)]

      dashboard.section.header.val = chosen_cat

      dashboard.section.buttons.val = {
        dashboard.button('f', '󰈞  Find file', ':Telescope find_files <CR>'),
        dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('r', '󱑆  Recently used files', ':Telescope oldfiles <CR>'),
        dashboard.button('t', '󱎸  Find text', ':Telescope live_grep <CR>'),
        dashboard.button('c', '  Configuration', ':e ~/.config/nvim/init.lua<CR>'),
        dashboard.button('q', '󰈆  Quit Neovim', ':qa<CR>'),
      }

      local function footer()
        return '코딩열심히해'
      end

      dashboard.section.footer.val = footer()

      dashboard.section.footer.opts.hl = 'Type'
      dashboard.section.header.opts.hl = 'Include'
      dashboard.section.buttons.opts.hl = 'Keyword'

      dashboard.opts.opts.noautocmd = true
      alpha.setup(dashboard.opts)
    end,
  },
}
