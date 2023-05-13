require("Yogsothoth.plugins-setup")

-- Core
require("Yogsothoth.core.options")
require("Yogsothoth.core.keymaps")
require("Yogsothoth.core.colorscheme")
require("Yogsothoth.core.lualine")

-- Plugins
require("Yogsothoth.plugins.nvim-tree")
require("Yogsothoth.plugins.telescope")
require("Yogsothoth.plugins.nvim-cmp")
require("Yogsothoth.plugins.nvim-ide")
require("Yogsothoth.plugins.autopairs")
require("Yogsothoth.plugins.treesitter")
require("Yogsothoth.plugins.gitsigns")

-- LSP Plugins
require("Yogsothoth.plugins.lsp.mason")
require("Yogsothoth.plugins.lsp.lspconfig")
require("Yogsothoth.plugins.lsp.lspsaga")
require("Yogsothoth.plugins.lsp.null-ls")

-- DAP Plugins
require("Yogsothoth.plugins.dap.nvim-dap")
--require("Yogsothoth.plugins.dap.init")
--require("Yogsothoth.plugins.dap.keymaps")

-- My Plugin
require("Yogsothoth.plugins.TerminalChess.init")
