local dap = require("dap")
local dapui = require("dapui")

-- Python
dap.adapters.python = {
	type = "executable",
	command = "lldb-vscode",
	name = "lldb",
}
dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		pythonPath = function()
			return "/usr/bin/python"
		end,
	},
}

-- C++
dap.adapters.cpp = {
	type = "executable",
	command = "lldb-vscode",
	name = "lldb",
}
dap.configurations.cpp = {
	{
		name = "Launch",
		type = "cpp",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		runInTerminal = false,
	},
}

dapui.setup({
	icons = { expanded = "⯆", collapsed = "⯈" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
	},
	sidebar = {
		open_on_start = true,
		elements = {
			-- Provide as ID strings or table with element
			{ id = "scopes", size = 0.25 },
			{ id = "breakpoints", size = 0.25 },
			{ id = "stacks", size = 0.25 },
			{ id = "watches", size = 0.20 },
		},
		size = 40,
		position = "left", -- Can be 'left' or 'right'
	},
	tray = {
		open_on_start = true,
		elements = { "repl" },
		size = 10,
		position = "bottom", -- Can be 'bottom' or 'top'
	},
	floating = {
		max_height = nil,
		max_width = nil,
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
})
