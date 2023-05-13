local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local keymap = vim.keymap

-- enable keybinds for available lsp server
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- go to declaration
	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition
	keymap.set("n", "gi", "<cmd> lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show diagnostics for line
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>", opts) -- show documentation for what is under the cursor
	keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

	-- Latex specific keymaps
	if client.name == "texlab" then
		keymap.set("n", "<leader>lc", ":VimtexCompile<CR>") -- recompile latex file
	end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- c and c++
lspconfig["clangd"].setup({
	capabilities = {
		--		capabilities,
		capabilities.offsetEncoding == "utf-8",
	},
	on_attach = on_attach,
})

-- python
lspconfig["jedi_language_server"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- html & css
--lspconfig["html"].setup({
--	capabilities = capabilities,
--	on_attach = on_attach,
--})
--lspconfig["cssls"].setup({
--	capabilities = capabilities,
--	on_attach = on_attach,
--})
--
---- javascript
--lspconfig["tsserver"].setup({
--	capabilities = capabilities,
--	on_attach = on_attach,
--})

-- cmake
lspconfig["cmake"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
-- c#
lspconfig["csharp_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- latex
lspconfig["texlab"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- java
lspconfig["jdtls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		java = {
			format = {
				settings = {
					url = "/usr/share/java/google-java-format/google-java-format.jar",
					profile = "GoogleStyle",
				},
			},
		},
	},
})

-- C#
--lspconfig["omnisharp"].setup({
--	capabilities = capabilities,
--	on_attach = on_attach,
--	enable_editorconfig_support = true,
--	enable_ms_build_load_projects_on_demend = false,
--	enable_roslyn_analyzers = false,
--	organize_imports_on_format = false,
--	enable_import_completion = false,
--	sdk_include_prereleases = true,
--	analyze_open_documents_only = false,
--})

lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for LUA
		Lua = {
			--make the language server recongnize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				--make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

-- change the diagnostic symbols in the sign colum(gutter)
-- NOT ADDED YET
