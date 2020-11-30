-- Fuzzy find actions
vim.cmd("command! ReaFuzz lua require('reaper-nvim').fuzzy_reaper_action()")
vim.cmd("command! ReaReplay lua require('reaper-nvim').reaper_action_replay()")

-- Transport
vim.cmd("command! ReaPlay lua require('reaper-nvim').toggle_play()")
vim.cmd("command! ReaStop lua require('reaper-nvim').stop()")
vim.cmd("command! ReaRecord lua require('reaper-nvim').record()")
vim.cmd("command! ReaGoToStart lua require('reaper-nvim').start_of_project()")
vim.cmd("command! ReaGoToEnd lua require('reaper-nvim').end_of_project()")

-- Undo
vim.cmd("command! ReaUndo lua require('reaper-nvim').undo()")

-- Repeating actions and scripts
vim.cmd("command! ReaRepeatLastAction lua require('reaper-nvim').repeat_last_action()")
vim.cmd("command! ReaRepeatActionPriorToLast lua require('reaper-nvim').repeat_action_prior_to_last()")
vim.cmd("command! ReaRunLastScript lua require('reaper-nvim').run_last_script()")
