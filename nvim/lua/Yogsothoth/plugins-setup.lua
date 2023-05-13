local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
    augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

-- Add plugins here
return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- lua functions that many plugins use
	use("nvim-lua/plenary.nvim")

	-- Colorscheme
	use("thedenisnikulin/vim-cyberpunk")
	use("nvim-lualine/lualine.nvim")

	-- Plugin to cycle through tmux panes
	use("christoomey/vim-tmux-navigator")

	-- Maximizes and restores current window
	use("szw/vim-maximizer")

	-- nvim ide like vscode
	use("ldelossa/nvim-ide")

	--	-- Allows adding/deleting of things that surround text
	--	use("tpope/vim-surround")
	--
	--	-- File explorer
	use("nvim-tree/nvim-tree.lua")
	--
	--	-- Adds icons for different programming languages
	use("kyazdani42/nvim-web-devicons")
	--
	-- Telescope file finder
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
	use({ "ibhagwan/fzf-lua", requires = { "nvim-tree/nvim-web-devicons" } })
	use({ "junegunn/fzf", run = "./install --bin" })
	--
	--	-- Autocompletion plugins
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	--
	--	-- Snippet plugins
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	--
	--	-- Managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- Configure lsp servers
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("lspsaga").setup({})
		end,
	})
	use("onsails/lspkind.nvim")

	-- Formatting & linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")
	--
	--	--Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	--
	--auto closing
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	--
	--	-- git signs
	use("lewis6991/gitsigns.nvim")
	--
	--	-- Latex
	use("lervag/vimtex")

	-- Vimball
	use("vim-scripts/Vimball")

	--- Debugging
	--	use({
	--		"mfussenegger/nvim-dap",
	--		opt = true,
	--		event = "BufReadPre",
	--		module = { "dap" },
	--		wants = { "nvim-dap-virtual-text", "DAPInstall.nvim", "nvim-dap-ui", "nvim-dap-python", "which-key.nvim" },
	--		requires = {
	--			"Pocco81/DAPInstall.nvim",
	--			"theHamsta/nvim-dap-virtual-text",
	--			"rcarriga/nvim-dap-ui",
	--			"mfussenegger/nvim-dap-python",
	--			"nvim-telescope/telescope-dap.nvim",
	--			{ "leoluz/nvim-dap-go", module = "dap-go" },
	--			{ "jbyuki/one-small-step-for-vimkind", module = "osv" },
	--		},
	--		config = function()
	--			require("config.dap").setup()
	--		end,
	--	})

	use("mfussenegger/nvim-dap")
	use("theHamsta/nvim-dap-virtual-text")
	use("nvim-telescope/telescope-dap.nvim")
	use({ "rcarriga/nvim-dap-ui", require = { "mfussenegger/nvim-dap" } })
	use("leoluz/nvim-dap-go")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
