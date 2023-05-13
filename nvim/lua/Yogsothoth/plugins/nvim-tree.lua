local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#ffff00 ]])

nvimtree.setup({
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})
