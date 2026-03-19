#!/usr/bin/env zsh

SCRIPT_DIR="${0:A:h}"

if ! pgrep -f "fzf-clipboard-watch" > /dev/null 2>&1; then
  nohup "$SCRIPT_DIR/bin/fzf-clipboard-watch" >/dev/null 2>&1 &
  disown
fi

# TODO: check zle usage maybe?? Commenting out those 2 doesnt change anything
fzf-clipboard-widget() {
  zle -I
  "$SCRIPT_DIR/bin/fzf-clipboard-select"
  zle reset-prompt
}

zle -N fzf-clipboard-widget
bindkey "${FZF_CLIPBOARD_KEY:-^P}" fzf-clipboard-widget
