local fuzzy_func = vim.g.reaper_fuzzy_command or "fzf"
local target_port = vim.g.reaper_target_port or 1234

local M = {}

function M.fzf(sources, sinkfunc, custom_options)
	local cmd = fuzzy_func;
	local fzf_run = vim.fn[cmd .. "#run"]
	local fzf_wrap = vim.fn[cmd .. "#wrap"]

	local wrapped = fzf_wrap("test", {
		source = sources,
		options = custom_options or {},
		-- don't set `sink` or `sink*` here
	})

	wrapped["sink*"] = nil   -- this line is required if you want to use `sink` only
	wrapped.sink = sinkfunc
	fzf_run(wrapped)
end

-- Execute reaper action via OSC
function M.send_action_osc(action_num)
	local argument = "/action"
	local port = target_port
	local cmd = string.format("osccli -a %s -m %s -p %s -t %s", argument, action_num, port, "int")
	M.silent_shell(cmd)
end

function M.silent_shell(cmd)
	vim.cmd("silent exe '! " .. cmd .. " &'")
end

return M
