local ok, dap = pcall(require, "dap")
if not ok then
	return
end

local keymap = vim.keymap.set
local fn = vim.fn
local opts = { silent = true, noremap = true }

keymap("n", "<F5>", dap.continue, opts)
keymap("n", "<F10>", dap.step_over, opts)
keymap("n", "<F11>", dap.step_into, opts)
keymap("n", "<F12>", dap.step_out, opts)
keymap("n", "<leader>db", dap.toggle_breakpoint, opts)
keymap("n", "<leader>dB", function()
	dap.set_break_point(fn.input("Breakpoint conditions: "))
end, opts)
keymap("n", "<leader>dl", function()
	dap.set_break_point(nil, nil, fn.input("Log point message: "))
end)
-- keymap("n", "<leader>dt", require"dap-go".debug_test, opts)

require("nvim-dap-virtual-text").setup()
require("dapui").setup()

local ok, dapui = pcall(require, "dapui")
if ok then
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end

	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end

	dap.listeners.before.event_exit["dapui_config"] = function()
		dapui.close()
	end
end
dap.adapters.mix_task = {
	type = "executable",
	command = "/home/lucio/.local/share/nvim/lsp_servers/elixirls/elixir-ls/debugger.sh",
	args = {},
}

dap.configurations.elixir = {
	{
		type = "mix_task",
		name = "mix test",
		task = "test",
		taskArgs = { "--trace" },
		request = "launch",
		startApps = true, -- for Phoenix projects
		projectDir = "${workspaceFolder}",
		requireFiles = {
			"test/**/test_helper.exs",
			"test/**/*_test.exs",
		},
	},
}

dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
  name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {function() return vim.fn.input("Args: ")end},

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = false,
  },
}

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

