vim.cmd([[packadd packer.nvim]])

require("packer").startup(function()
  use({
    "wbthoason/packer.nvim",
  })

  use({ "nvim-lua/plenary.nvim" })

  use({ "nvim-tree/nvim-web-devicons" })

  use({ "sainnhe/everforest", opt = true })
  use({ "EdenEast/nightfox.nvim", opt = true })
  use({
    "rmehri01/onenord.nvim",
    config = function()
      require("onenord").setup()
    end,
  })

  use({ "machakann/vim-sandwich", event = "BufEnter" })

  use({ "tpope/vim-surround", event = "BufEnter" })

  use({ "tpope/vim-repeat", event = "BufEnter" })

  -- Indentline
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        show_end_of_line = true,
      })
    end,
    event = "BufEnter",
  })
  -- Statusline
  use({
    "nvim-lualine/lualine.nvim",
    config = function()
      require("configs.lualine")
    end,
    requires = { "nvim-web-devicons", opt = true },
  })

  use({
    "kdheepak/tabline.nvim",
    config = function()
      require("tabline").setup({
        enable = true,
        options = {
          section_separators = { "", "" },
          component_separators = { "", "" },
        },
      })
      vim.cmd([[
                set guioptions-=e
                set sessionoptions+=tabpages,globals
            ]])
    end,
    requires = {
      { "lualine.nvim",      opt = true },
      { "nvim-web-devicons", opt = true },
    },
  })

  use({
    "petertriho/nvim-scrollbar",
    config = function()
      require("configs.scrollbar")
    end,
    event = "BufRead",
  })

  --TODO
  use({
    "goolord/alpha-nvim",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("configs.alpha")
    end,
    event = "BufEnter",
  })

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("configs.telescope")
    end,
  })

  -- Mason: Portable package manager
  use({
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  })

  use({
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("configs.mason-lsp")
    end,
    after = "mason.nvim",
  })

  -- LSP
  use({
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lsp")
    end,
  })

  use({
    "onsails/lspkind-nvim",
  })

  use({
    "L3MON4D3/LuaSnip",
    tag = "v<CurrentMajor>.*",
  })

  -- cmp: Autocomplete
  use({
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require("configs.cmp")
    end,
  })

  use("hrsh7th/cmp-nvim-lsp")

  use({ "hrsh7th/cmp-path", after = "nvim-cmp" })

  use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })

  -- LSP diagnostics, code actions, and more via Lua.
  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("configs.null-ls")
    end,
    requires = { "nvim-lua/plenary.nvim" },
  })

  --use({
  --	"mrcjkb/haskell-tools.nvim",
  --	config = function()
  --		require("configs.haskell")
  --	end,
  --	requires = {
  --		"nvim-lua/plenary.nvim",
  --		"telescope.nvim",
  --	},
  --	branch = "1.x.x",
  --})

  --TODO
  use({
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("configs.treesitter")
    end,
  })

  -- File manager
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("configs.neotree")
    end,
    event = "BufEnter",
  })

  -- Show colors
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" })
    end,
  })

  -- Terminal
  use({
    "akinsho/toggleterm.nvim",
    event = "BufEnter",
    tag = "*",
    config = function()
      require("configs.toggleterm")
    end,
    opt = true,
  })

  -- Git
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("configs.gitsigns")
    end,
    event = "BufRead",
  })

  -- autopairs
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("configs.autopairs")
    end,
    event = "InsertEnter",
  })

  -- Background Transparent
  use({
    "xiyaowong/nvim-transparent",
    config = function()
      require("configs.transparent")
    end,
  })
end)
