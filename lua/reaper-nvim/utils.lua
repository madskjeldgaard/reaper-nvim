vim.g.reaper_last_action = 0
local fuzzy_func = vim.g.reaper_fuzzy_command or "fzf"
local target_port = vim.g.reaper_target_port or 1234
local target_ip = vim.g.reaper_target_ip or "127.0.0.1"
vim.g.reaper_browser_command = vim.g.reaper_browser_command or "firefox"

local M = {}

function M.open_url(url)
	local command = vim.g.reaper_browser_command or "firefox"
	M.silent_shell(string.format("%s %s", command, url))
end

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
	vim.g.reaper_last_action = action_num

	local argument = "/action"
	M.send_message(argument, action_num);
end

function M.silent_shell(cmd)
	vim.cmd("silent exe '! " .. cmd .. " &'")
end


local osc = require'osc'.new{
  transport = 'udp',
  sendAddr = target_ip,
  sendPort = target_port,
}

function M.send_message(address, command_num)
	local message = osc.new_message{
		address = address,
		types = 'i',
		command_num
	}

	local ok, err = osc:send(message)
	if not ok then
	print(err)
	end
end

return M
