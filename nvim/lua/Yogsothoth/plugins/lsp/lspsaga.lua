--local saga = require("lspsaga")

--local saga_status, saga = pcall(require, "lspsaga")
--if not saga_status then
--	return
--end

--saga.init_lsp_saga({
--	move_in_saga = { prev = "<C-k>", next = "<C-j>" },
--	finder_action_keys = {
--		open = "<CR>",
--	},
--	definition_action_keys = {
--		edit = "<CR>",
--	},
--})
--saga.init_lsp_saga({
--	--keybinds for moving in lspsaga window
--	move_in_saga = { prev = "<C-k>", next = "<C-j>" },
--	-- use enter to open file with finer
--	finder_action_keys = {
--		open = "<CR>",
--	},
--	-- use enter to open file with definition preview
--	definition_action_keys = {
--		edit = "<CR>",
--	},
--})