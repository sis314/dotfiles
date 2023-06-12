vim.cmd [[packadd packer.nvim]]

require("packer").startup(function()
  use {
    "wbthomason/packer.nvim",
    event = {"CmdlineEnter"},
    opt = true
  }
  
  use { "nvim-lua/plenary.nvim"}

  use { "nvim-tree/nvim-web-devicons" }

  use { "rebelot/kanagawa.nvim" }

  use { "machakann/vim-sandwich", event = "BufEnter", opt = true}

  use { "tpope/vim-surround", event = "BufEnter", opt = true}

  use { "tpope/vim-repeat" , event = "BufEnter", opt = true}

  -- Statusline
  use {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("configs.lualine")
    end,
    requires = {"nvim-web-devicons"},
  }

  use {
    'kdheepak/tabline.nvim',
    config = function()
      require'tabline'.setup {
        enable = true,
        options = {
          section_separators = {'', ''},
          component_separators = {'', ''},
          max_bufferline_percent = 66,
          show_tabs_always = false,
          show_devicons = true,
          show_bufnr = false,
          show_filename_only = false,
          modified_icon = "+ ",
          modified_italic = false,
          show_tabs_only = false,
        }
      }
      vim.cmd[[
      set guioptions-=e " Use showtabline in gui vim
      set sessionoptions+=tabpages,globals " store tabpages and globals in session
      ]]
    end,
    requires = { { 'lualine.nvim', opt=true }, {'nvim-web-devicons', opt = true} }
  }

  use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    event = "BufEnter",
    config = function ()
      require("configs.alpha")
    end,
    opt = true
  }

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("configs.telescope")
    end,
  }

	-- LSP
	use{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lsp")
		end,
	}

	use("onsails/lspkind-nvim")
	use{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v<CurrentMajor>.*",
	}

	-- cmp: Autocomplete
	use{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("configs.cmp")
		end,
	}

	use("hrsh7th/cmp-nvim-lsp")

	use{ "hrsh7th/cmp-path", after = "nvim-cmp" }

	use{ "hrsh7th/cmp-buffer", after = "nvim-cmp" }

	-- LSP diagnostics, code actions, and more via Lua.
	use{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("configs.null-ls")
		end,
		requires = { "nvim-lua/plenary.nvim" },
	}

	-- Mason: Portable package manager
	use{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	}

	use{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("configs.mason-lsp")
		end,
		after = "mason.nvim",
	}

	-- File manager
	use{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	}

	-- Show colors
	use{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "*" })
		end,
	}

	-- Terminal
	use{
		"akinsho/toggleterm.nvim",
    event = "BufEnter",
		tag = "*",
		config = function()
			require("configs.toggleterm")
		end,
    opt = true
	}

	-- Git
	use{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("configs.gitsigns")
		end,
	}

	-- autopairs
	use{
		"windwp/nvim-autopairs",
		config = function()
			require("configs.autopairs")
		end,
	}

	-- Background Transparent
	use{
		"xiyaowong/nvim-transparent",
		config = function()
			require("configs.transparent")
    end, 
  }

end)
