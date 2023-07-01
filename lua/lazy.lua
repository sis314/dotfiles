require("lazy").setup(
	{
		"rmehri01/onenord.nvim",
		config = function()
			require("onenord").setup()
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				show_end_of_line = true,
			})
		end,
		event = "BufEnter",
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("configs.lualine")
		end,
		requires = { "nvim-web-devicons", opt = true },
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
		requires = {
			{ "lualine.nvim", opt = true },
			{ "nvim-web-devicons", opt = true },
		},
	},
	{
		"petertriho/nvim-scrollbar",
		config = function()
			require("configs.scrollbar")
		end,
		event = "BufRead",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("configs.telescope")
		end,
	},
    )
--	{
--		"williamboman/mason.nvim",
--		config = function()
--			require("mason").setup()
--		end,
--	},
--	{
--		"williamboman/mason-lspconfig.nvim",
--		config = function()
--			require("configs.mason-lsp")
--		end,
--		after = "mason.nvim",
--	},
--	{
--		"neovim/nvim-lspconfig",
--		config = function()
--			require("configs.lsp")
--		end,
--	},
--	{
--		"onsails/lspkind-nvim",
--	},
--	{
--		"L3MON4D3/LuaSnip",
--		tag = "v<CurrentMajor>.*",
--	},
--	{
--		"hrsh7th/nvim-cmp",
--		event = "InsertEnter",
--		config = function()
--			require("configs.cmp")
--		end,
--	},
--	{ "hrsh7th/cmp-nvim-lsp" },
--	{ "hrsh7th/cmp-path", after = "nvim-cmp" },
--	{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
--	{
--		"jose-elias-alvarez/null-ls.nvim",
--		config = function()
--			require("configs.null-ls")
--		end,
--		requires = { "nvim-lua/plenary.nvim" },
--	},
--	{ "machakann/vim-sandwich", event = "BufEnter" },
--	{ "tpope/vim-surround", event = "BufEnter" },
--	{ "tpope/vim-repeat", event = "BufEnter" },
