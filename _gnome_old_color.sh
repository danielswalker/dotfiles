#!/bin/bash
# terminal color switcher for Ubuntu

# http://www.tldp.org/LDP/abs/html/functions.html
set_dark() {
  PALETTE="#070736364242:#DCDC32322F2F:#858599990000:#B5B589890000:#26268B8BD2D2:#D3D336368282:#2A2AA1A19898:#EEEEE8E8D5D5:#00002B2B3636:#CBCB4B4B1616:#58586E6E7575:#65657B7B8383:#838394949696:#6C6C7171C4C4:#9393A1A1A1A1:#FDFDF6F6E3E3"
  # PALETTE="#070736364242:#D3D301010202:#858599990000:#B5B589890000:#26268B8BD2D2:#D3D336368282:#2A2AA1A19898:#EEEEE8E8D5D5:#00002B2B3636:#CBCB4B4B1616:#58586E6E7575:#65657B7B8383:#838394949696:#6C6C7171C4C4:#9393A1A1A1A1:#FDFDF6F6E3E3"
  BG_COLOR="#00002B2B3636"
  FG_COLOR="#838394949696"
  # FG_COLOR="#65657B7B8383"
  gconftool-2 --set "/apps/gnome-terminal/profiles/Default/use_theme_background" --type bool false
  gconftool-2 --set "/apps/gnome-terminal/profiles/Default/use_theme_colors" --type bool false
  gconftool-2 --set "/apps/gnome-terminal/profiles/Default/palette" --type string "$PALETTE"
  gconftool-2 --set "/apps/gnome-terminal/profiles/Default/background_color" --type string "$BG_COLOR"
  gconftool-2 --set "/apps/gnome-terminal/profiles/Default/foreground_color" --type string "$FG_COLOR"
  export THEME="dark"
  export COLORFGBG="12;8"
}

set_light() {
  PALETTE="#070736364242:#DCDC32322F2F:#858599990000:#B5B589890000:#26268B8BD2D2:#D3D336368282:#2A2AA1A19898:#EEEEE8E8D5D5:#00002B2B3636:#CBCB4B4B1616:#58586E6E7575:#65657B7B8383:#838394949696:#6C6C7171C4C4:#9393A1A1A1A1:#FDFDF6F6E3E3"
  # PALETTE="#EEEEE8E8D5D5:#D3D301010202:#858599990000:#B5B589890000:#26268B8BD2D2:#D3D336368282:#2A2AA1A19898:#070736364242:#FDFDF6F6E3E3:#CBCB4B4B1616:#9393A1A1A1A1:#838394949696:#65657B7B8383:#6C6C7171C4C4:#58586E6E7575:#00002B2B3636"
  BG_COLOR="#FDFDF6F6E3E3"
  FG_COLOR="#65657B7B8383"
  # FG_COLOR="#838394949696"
  gconftool-2 --set "/apps/gnome-terminal/profiles/Default/use_theme_background" --type bool false
  gconftool-2 --set "/apps/gnome-terminal/profiles/Default/use_theme_colors" --type bool false
  gconftool-2 --set "/apps/gnome-terminal/profiles/Default/palette" --type string "$PALETTE"
  gconftool-2 --set "/apps/gnome-terminal/profiles/Default/background_color" --type string "$BG_COLOR"
  gconftool-2 --set "/apps/gnome-terminal/profiles/Default/foreground_color" --type string "$FG_COLOR"
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
