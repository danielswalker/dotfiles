#!/bin/bash
# color switcher for tmux

set_dark() {
  if { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
    tmux source-file ~/.tmux_tools/tmux_dark.conf
  fi
  if { [ "$TERM" = "screen-256color" ] && [ -n "$TMUX" ]; } then
    tmux source-file ~/.tmux_tools/tmux_dark.conf
  fi
}

set_light() {
  if { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
    tmux source-file ~/.tmux_tools/tmux_light.conf
  fi
  if { [ "$TERM" = "screen-256color" ] && [ -n "$TMUX" ]; } then
    tmux source-file ~/.tmux_tools/tmux_light.conf
  fi
}

# http://www.tldp.org/LDP/abs/html/comparison-ops.html
# quotes needed here, otherwise error when no arguments
if [ "$1" = "light" ]; then
  set_light
elif [ "$1" = "dark" ]; then
  set_dark
else
  # http://www.tldp.org/LDP/abs/html/quotingvar.html
  # quotes not needed in this case, because value will always be single word (number)
  if [ "$(date +%H)" -ge 17 ]; then
    set_light
  else
    set_dark
  fi
fi
