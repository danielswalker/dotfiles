#!/bin/bash
# terminal color switcher for Ubuntu
# inspired by https://github.com/Anthony25/gnome-terminal-colors-solarized

# http://ethanschoonover.com/solarized
# light
base3='#fdfdf6f6e3e3'  # background
base00='#65657b7b8383' # body text/default code/primary content
base01='#58586e6e7575' # optional emphasized content
# dark
base03='#00002b2b3636' # background
base0='#838394949696'  # body text/default code/primary content
base1='#9393a1a1a1a1'  # optional emphasized content

# may need to set up multiple terminal profiles and designate one as default
profile_id="$(dconf read /org/gnome/terminal/legacy/profiles:/default|sed s/\'//g)"
# echo $profile_id
# echo $profile_id >> /home/antonios/terminal-color.log
# http://www.tldp.org/LDP/abs/html/functions.html
set_dark() {
  dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/background-color "'$base03'"
  dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/foreground-color "'$base0'"
  dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/bold-color "'$base1'"
  export THEME="dark"
  export COLORFGBG="12;8"
}

set_light() {
  dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/background-color "'$base3'"
  dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/foreground-color "'$base00'"
  dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/bold-color "'$base01'"
  export THEME="light"
  export COLORFGBG="12;7"
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
