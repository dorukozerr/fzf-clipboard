# fzf-clipboard

Zsh plugin: fzf-powered clipboard history (currently macOS only).

## Installation

**Plugin Managers**

```zsh
# zap
plug "dorukozerr/fzf-clipboard"

# zinit
zinit light dorukozerr/fzf-clipboard

# oh-my-zsh
# Clone into oh-my-zsh custom plugins directory
git clone https://github.com/dorukozerr/fzf-clipboard ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-clipboard
# Then add to plugins array in .zshrc
plugins=(... fzf-clipboard)
```

**Manual**

```zsh
git clone https://github.com/dorukozerr/fzf-clipboard ~/.local/share/fzf-clipboard-plugin
echo 'source ~/.local/share/fzf-clipboard-plugin/fzf-clipboard.plugin.zsh' >> ~/.zshrc
```

## Usage

Press **Ctrl+Y** to open the clipboard history picker. The selected item is copied back to your clipboard.

The watcher daemon starts automatically in the background (pid-managed) and records clipboard changes.

## Configuration

Set these in your `.zshrc` before sourcing the plugin if you want to customize defaults.

```zsh
export FZF_CB_KEY='^Y'                                  # keybind (default: ^Y)
export FZF_CB_HISTORY_LIMIT=100                         # max entries to keep (default: 100)
export FZF_CB_DAEMON_POLL_INTERVAL=1                    # poll interval in seconds (default: 1)
export FZF_CB_HISTORY_DIR=~/.local/share/fzf-clipboard  # history location
```

## Dependencies

- [fzf](https://github.com/junegunn/fzf)
- macOS (`pbcopy` / `pbpaste`)
