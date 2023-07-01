return {
  {
    "rmehri01/onenord.nvim",
    config = function()
      require("onenord").setup()
    end,
    lazy = true,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        show_end_of_line = true,
      })
    end,
    lazy = true,
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("configs.lualine")
    end,
    dependencies = { "nvim-web-devicons" },
    lazy = true,
  },
  {
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
    dependencies = {
      { "nvim-lualine/lualine.nvim" },
      { "nvim-web-devicons" },
    },
    event = { "VeryLazy" },
  },
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("configs.scrollbar")
    end,
    event = "VeryLazy",
  },

  { "nvim-lua/plenary.nvim",  lazy = true },

  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("configs.telescope")
    end,
    keys = {
      { "<leader>ff", "<cmd> Telescope find_files<cr>" },
      { "<leader>fg", "<cmd> Telescope live_grep<cr>" },
      { "<leader>fb", "<cmd> Telescope buffers<cr>" },
      { "<leader>fh", "<cmd> Telescope help_tags<cr>" },
      { "<leader>fs", "<cmd> Telescope git_status<cr>" },
      { "<leader>fc", "<cmd> Telescope git_commits<cr>" },
      { "<leader>fr", "<cmd> Telescope oldfiles<cr>" },
    },
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
    dependencies = "null-ls.nvim",
    lazy = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("configs.mason-lsp")
    end,
    dependencies = "mason.nvim",
    lazy = true,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lsp")
    end,
    dependencies = { "mason-lspconfig.nvim", "lspkind-nvim" },
  },
  {
    "onsails/lspkind-nvim",
    lazy = true,
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("configs.cmp")
    end,
    lazy = true,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    dependencies = "nvim-cmp",
    event = "InsertEnter",
  },
  {
    "hrsh7th/cmp-path",
    dependencies = "nvim-cmp",
    event = "InsertEnter",
  },
  {
    "hrsh7th/cmp-buffer",
    dependencies = "nvim-cmp",
    event = "InsertEnter",
  },
  {
    "hrsh7th/cmp-cmdline",
    dependencies = "nvim-cmp",
    event = "CmdLineEnter",
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("configs.null-ls")
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
  },
  {
    "L3MON4D3/LuaSnip",
    tag = "v<CurrentMajor>.*",
    event = "InsertEnter",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("configs.treesitter")
    end,
    event = "VeryLazy",
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" })
    end,
    event = "BufEnter",
  },
  { "machakann/vim-sandwich", event = "VeryLazy" },
  { "tpope/vim-surround",     event = "VeryLazy" },
  { "tpope/vim-repeat",       event = "VeryLazy" },
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("configs.toggleterm")
    end,
    keys = { "<F7>", "<cmd>ToggleTerm<cr>" },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("configs.neotree")
    end,
    event = "VeryLazy",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("configs.gitsigns")
    end,
    event = "VeryLazy",
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("configs.autopairs")
    end,
    event = "InsertEnter",
  },
  {
    "xiyaowong/nvim-transparent",
    config = function()
      require("configs.transparent")
    end,
  },
}
