return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
      vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Prev buffer' })

      require('bufferline').setup {
        options = {

          -- Hide bufferline when no real files are open
          always_show_bufferline = false,

          -- Don’t show special buffers
          custom_filter = function(buf)
            -- hide unnamed buffers
            if vim.fn.bufname(buf) == '' then
              return false
            end

            -- hide non-file buffers (help, neo-tree, ...)
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
      }
    end,
  },
}
