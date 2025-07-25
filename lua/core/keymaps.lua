-- Detect OS for platform-specific shortcuts
local is_macos = vim.loop.os_uname().sysname == "Darwin"
local new_tab_key = is_macos and "<D-t>" or "<A-t>" -- Cmd+T (Mac) or Alt+T (others)

-- Consistent options for all keymaps
local opts = { noremap = true, silent = true }

-- === File Explorer ===
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, opts)                  -- Legacy explorer
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", opts)           -- Toggle NvimTree

-- === Buffers ===
vim.keymap.set("n", new_tab_key, ":enew<CR>", opts)                 -- New buffer (Cmd+T or Alt+T)
vim.keymap.set("n", "<C-t>", ":enew<CR>", opts)                     -- Also Ctrl+T for new buffer
vim.keymap.set("n", "<C-w>", ":bd<CR>", opts)                       -- Close buffer

-- Buffer navigation with Alt+1–9
for i = 1, 9 do
  vim.keymap.set("n", "<A-" .. i .. ">", "<Cmd>BufferLineGoToBuffer " .. i .. "<CR>", opts)
end

-- Optional: Navigate buffers with Tab/Shift-Tab (normal mode only)
vim.keymap.set("n", "<Tab>", "<Cmd>bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", "<Cmd>bprevious<CR>", opts)

-- === Split navigation (optional) ===
vim.keymap.set("n", "<C-h>", "<C-w>h", opts) -- Move left
vim.keymap.set("n", "<C-l>", "<C-w>l", opts) -- Move right
vim.keymap.set("n", "<C-j>", "<C-w>j", opts) -- Move down
vim.keymap.set("n", "<C-k>", "<C-w>k", opts) -- Move up
