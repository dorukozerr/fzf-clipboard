#!/usr/bin/env zsh

SCRIPT_DIR="${0:A:h}"

if ! pgrep -f "clipd.sh" > /dev/null 2>&1; then
  "$SCRIPT_DIR/clipd.sh" &
  disown
fi

fzf-clipboard() {
  "$SCRIPT_DIR/clipboard.fzf"
}

fzf-clipboard-widget() {
  zle -I
  fzf-clipboard
  zle reset-prompt
}

zle -N fzf-clipboard-widget
bindkey '^Y' fzf-clipboard-widget
