require("nvim-tree").setup({
  hijack_netrw = true,
  view = {
    width = 30,
    side = "left",
    preserve_window_proportions = true,
  },
  update_focused_file = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        folder = true,
        file = true,
        git = true,
      },
    },
  },
  actions = {
    open_file = {
      quit_on_open = false,
      resize_window = true,
    },
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "NvimTree",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})
