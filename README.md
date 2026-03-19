# fzf-clipboard

Zsh plugin: fzf-powered clipboard history (macOS only).

## Installation

```
# Plugin manager example (zap)
plug "esc/conda-zsh-completion"
# Manual, TBU
# source ~/.sandbox/fzf-clipboard/fzf-clipboard.plugin.zsh
```

## Usage

Press **Ctrl+P** to select from history (copies chosen item to clipboard).

## Config (in `.zshrc`)

```
export FZF_CB_KEY='^P'
export FZF_CB_HISTORY_LIMIT=100
export FZF_CB_DAEMON_POLL_INTERVAL=1
export FZF_CB_HISTORY_DIR=~/.local/share/fzf-clipboard
```

Daemon auto-starts (pid-managed). History in `$FZF_CB_HISTORY_DIR/.cache`.
