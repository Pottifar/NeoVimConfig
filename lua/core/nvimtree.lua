-- ~/.config/nvim/lua/core/nvimtree.lua
require("nvim-tree").setup()
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

