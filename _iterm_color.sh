#!/bin/bash
# terminal profiler toggler for iTerm

# http://www.tldp.org/LDP/abs/html/functions.html
set_dark() {
  if [ "$TERM_PROGRAM" = "iTerm.app" ]; then
    # switch to dark colored iterm profile
    export THEME="dark"
    export COLORFGBG="12;8"
    osascript -e 'tell app "System Events" to keystroke "d" using {option down, control down, command down}'
  fi
}

set_light() {
  if [ "$TERM_PROGRAM" = "iTerm.app" ]; then
    # switch to light colored iterm profile
  export THEME="light"
  export COLORFGBG="12;7"
    osascript -e 'tell app "System Events" to keystroke "l" using {option down, control down, command down}'
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
