# Reaper-nvim

![fuzzy reaper](/assets/fuzzy-reaper.gif)

A neovim plugin for controlling the Reaper DAW from neovim.

Among other things, it makes it possible to execute all of Reaper's +3700 main actions remotely from neovim via Open Sound Control (osc). 

This is useful when writing music in neovim or scripting for reaper in neovim.

# Requirements

- nvim >= 0.5
- fzf/skim
- [osccli](https://github.com/madskjeldgaard/osccli)

## Commands

### Fuzzy action execution

`:ReaFuzz`

Fuzzily choose between almost 4000 different Reaper Actions to execute from nvim. Uses either fzf or skim

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
vim.g.reaper_fuzzy_command or "fzf"

-- Target port of the Reaper session receiving these osc messages
vim.g.reaper_target_port = 1234

```
