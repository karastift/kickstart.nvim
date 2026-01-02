return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = 'VeryLazy',

    -- keymaps can stay here
    keys = {
      { '<Tab>', '<cmd>BufferLineCycleNext<CR>', desc = 'Next buffer' },
      { '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', desc = 'Prev buffer' },
    },

    opts = {
      options = {
        -- Hide bufferline when no real files are open
        always_show_bufferline = false,

        -- Don’t show special buffers
        custom_filter = function(buf)
          if vim.fn.bufname(buf) == '' then
            return false
          end
          if vim.bo[buf].buftype ~= '' then
            return false
          end
          return true
        end,

        diagnostics = 'nvim_lsp',

        offsets = {
          {
            filetype = 'neo-tree',
            text = '',
            highlight = 'Directory',
            separator = true,
          },
        },
      },
    },
  },
}
