#!/usr/bin/env zsh

SCRIPT_DIR="${0:A:h}"

if ! pgrep -f "fzf-clipboard-watch" > /dev/null 2>&1; then
  nohup "$SCRIPT_DIR/bin/fzf-clipboard-watch" >/dev/null 2>&1 &
  disown
fi

fzf_clipboard_widget() {
  zle -I
  "$SCRIPT_DIR/bin/fzf-clipboard-select"
  zle reset-prompt
}

zle -N fzf_clipboard_widget
bindkey "${FZF_CB_KEY:-^P}" fzf_clipboard_widget
