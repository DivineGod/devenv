local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
	git = {
		clone_timeout = 300, -- Timeout, in seconds, for git clones
	},
}

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use({
		"sainnhe/everforest",
		as = 'everforest',
	})

	use { "ahmedkhalf/project.nvim" }

	use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
	use('nvim-treesitter/playground')
	use('mbbill/undotree')

	use('tpope/vim-fugitive')
	use('tpope/vim-surround')
	use('tpope/vim-repeat')
	use('tpope/vim-sleuth')

	use('imsnif/kdl.vim')

	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			{ "jose-elias-alvarez/null-ls.nvim" },
			{ "jay-babu/mason-null-ls.nvim" }, -- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets' },
		}
	}

	use { 'simrat39/rust-tools.nvim' }

	-- DAP
	use { "mfussenegger/nvim-dap" }   -- , commit = "6b12294a57001d994022df8acbe2ef7327d30587" }
	use { "rcarriga/nvim-dap-ui" }    -- , commit = "1cd4764221c91686dcf4d6b62d7a7b2d112e0b13" }
	use { "ravenxrz/DAPInstall.nvim" } -- , commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" }
end)
