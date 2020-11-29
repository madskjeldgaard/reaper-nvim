local commands = require('reaper-nvim/actions')
local utils = require('reaper-nvim/utils')

local M = {}

function M.setup()
	require('reaper-nvim/commands')
end

function M.fuzzy_reaper_action()

	local reaper_keys = {}

	for k,_ in pairs(commands) do
		table.insert(reaper_keys, k)
	end

	utils.fzf(reaper_keys, function(reaper_action_key)
			local action_id = commands[reaper_action_key]
			utils.send_action_osc(action_id)
		end
	)

end

function M.toggle_play()
	local action_num = 40044
	utils.send_action_osc(action_num)
end

function M.stop()
	local action_num = 1016
	utils.send_action_osc(action_num)
end

function M.record()
	local action_num = 1013
	utils.send_action_osc(action_num)
end

function M.repeat_last_action()
	local action_num = 2999
	utils.send_action_osc(action_num)
end

function M.repeat_action_prior_to_last()
	local action_num = 40078
	utils.send_action_osc(action_num)
end


function M.run_last_script()
	local action_num = 41061
	utils.send_action_osc(action_num)
end

function M.undo()
	local action_num = 40029
	utils.send_action_osc(action_num)
end


function M.toggle_mixer()
	local action_num = 40078
	utils.send_action_osc(action_num)
end

function M.start_of_project()
	local action_num = 40042
	utils.send_action_osc(action_num)
end

function M.end_of_project()
	local action_num = 40043
	utils.send_action_osc(action_num)
end

return M
