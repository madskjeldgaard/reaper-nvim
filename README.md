# Reaper-nvim

![fuzzy reaper](/assets/fuzzy-reaper.gif)

A neovim plugin for controlling the Reaper DAW from neovim.

Among other things, it makes it possible to execute all of Reaper's +3700 main actions remotely from neovim via Open Sound Control (osc). 

This is useful when writing music in neovim or scripting for reaper in neovim.

# Requirements

- nvim >= 0.5
- fzf/skim
- [osccli](https://github.com/madskjeldgaard/osccli)

## Install
To install using vim-plug
1. Add this to your init.vim / .vimrc:
`Plug 'madskjeldgaard/reaper-nvim'`
2. Open Vim and run the command `:PlugInstall`

# Usage

To activate this plugin for all file types:
```vimscript
" Reaper
autocmd filetype * lua require'reaper-nvim'.setup()
```

To activate this plugin for some file types:
```vimscript
" Reaper
autocmd filetype supercollider,csound,lua lua require'reaper-nvim'.setup()
```

## Commands

### Fuzzy action execution

`:ReaFuzz`

Fuzzily choose between almost 4000 different Reaper Actions to execute from nvim. Uses either fzf or skim


### Replay last action

![replay actions](/assets/replay-action.gif)

Everytime you execute and send an action to Reaper, it's id is saved in the global variable `vim.g.reaper_last_action`.

For convenience's sake, you can replay this latest action by executing:
`:ReaReplay`

### Transport controls
`:ReaPlay`

`:ReaStop`

`:ReaRecord`

`:ReaGoToStart`

`:ReaGoToEnd`

### Editing
`:ReaUndo`

### Repeating actions and scripts
These are useful when writing scripts for reaper.

`:ReaRepeatLastAction`

`:ReaRepeatActionPriorToLast`

`:ReaRunLastScript`

## Options

```lua
-- Which fuzzy finder to use with reaper-nvim: Can be either "fzf" or "skim"
vim.g.reaper_fuzzy_command = "fzf"

-- Target port of the Reaper session receiving these osc messages
vim.g.reaper_target_port = 1234

-- Target ip
vim.g.reaper_target_ip = "127.0.0.1"
```
