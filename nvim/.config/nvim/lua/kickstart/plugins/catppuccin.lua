return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      transparent_background = true,
      term_colors = true,
    },
    init = function()
      vim.cmd.colorscheme 'catppuccin-macchiato'
      -- Configure highlights
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
