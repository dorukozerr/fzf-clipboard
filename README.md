# fzf-clipboard

Zsh plugin: fzf-powered clipboard history (currently macOS only).

## Usage

**Ctrl+P** (^P) after plugin enabled and anything copied

## Config (`$ZDOTDIR/.zshrc`)

Environment variables you can set and thei default values

```
export FZF_CB_KEY='^[p'  # Alt+P
export FZF_CB_MAX=1
export FZF_CB_POLL=1
export FZF_CB_HISTORY_DIR=~/.cache/fzf-clipboard
```

Daemon (`fzf-clipboard-watch`) auto-starts, pidfile-managed.
History: `~/.local/share/fzf-clipboard/.fzf_clipboard_history` (default).
