
-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- UI enhancements
  "nvim-lualine/lualine.nvim",
  "nvim-tree/nvim-tree.lua",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-treesitter/nvim-treesitter",
  "akinsho/bufferline.nvim",
  "kyazdani42/nvim-web-devicons",

  -- LSP manager: mason + automatic setup (backwards-compatible)
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" },
    config = function()
      require("mason").setup()

      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup({
        ensure_installed = {
          "pyright",       -- Python
          "terraformls",   -- Terraform
          "lua_ls",        -- Lua (for editing config)
          "jsonls",        -- JSON files
        },
        automatic_installation = true,
      })

      -- Safe fallback for older versions (no setup_handlers)
      for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
        lspconfig[server_name].setup({})
      end
    end,
  },

  -- CMP (with ghost text)
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
        experimental = {
          ghost_text = true,
        },
      })
    end,
  },

  -- Auto-close brackets, quotes, etc.
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
})
