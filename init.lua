
-- Load plugins
require("core.plugins")
require("core.nvimtree")
require("bufferline").setup{}

-- Basic editor settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.cmd([[highlight CursorLine ctermbg=236 guibg=#2a2a2a]])

vim.cmd([[syntax on]])
vim.cmd([[filetype plugin indent on]])

local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
local is_macos = vim.loop.os_uname().sysname == "Darwin"
local is_linux = not is_windows and not is_macos

vim.cmd [[
  autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform
]]

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.termguicolors = true
vim.cmd([[colorscheme desert]])

vim.opt.scrolloff = 5

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.showmatch = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

-- Keymaps

-- Open file explorer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { noremap = true, silent = true })

-- Ctrl + N to toggle NvimTree
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Cmd + W to close current buffer
vim.keymap.set('n', '<C-w>', ':bd<CR>', { noremap = true, silent = true })

-- Cmd + T to open a new buffer
vim.keymap.set('n', '<D-t>', ':enew<CR>', { noremap = true, silent = true })

-- Ctrl + T to open a new empty buffer
vim.keymap.set('n', '<C-t>', ':enew<CR>', { noremap = true, silent = true })

-- Ctrl + 1–9 to switch to buffers 1–9
for i = 1, 9 do
  vim.keymap.set('n', '<C-' .. i .. '>', function()
    vim.cmd(i .. 'b')
  end, { noremap = true, silent = true })
end

