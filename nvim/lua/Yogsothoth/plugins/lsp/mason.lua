local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
	ensure_installed = {
		"clangd",
		"cmake",
		"csharp_ls",
		"texlab",
		--		"tsserver",
		--		"html",
		--		"cssls",
		"jedi_language_server",
		"jdtls",
		"lua_ls",
	},
	--auto-install configured servers (with lspconfig)
	automatic_installation = true,
})

mason_null_ls.setup({
	ensure_installed = {
		"stylua",
		"tidy",
		--		"cspell",
		--		"eslint_d",
		"clang_format",
		"cpplint",
		--		"prettier",
		"csharpier",
		"shfmt",
		"pylint",
	},
	--auto-install configured formatters & linters (with lspconfig)
	automatic_installation = true,
})
