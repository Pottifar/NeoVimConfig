-- ~/.config/nvim/lua/core/bufferline.lua
require("bufferline").setup{}

-- Optional: Use Alt+1–9 to jump between tabs (macOS)
for i = 1, 9 do
  vim.keymap.set("n", "<A-"..i..">", "<Cmd>BufferLineGoToBuffer "..i.."<CR>", { noremap = true, silent = true })
end

