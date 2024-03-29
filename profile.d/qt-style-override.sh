if [ -z "$QT_STYLE_OVERRIDE" ] && [ "$XDG_CURRENT_DESKTOP" == "Pantheon" ]; then
  export QT_STYLE_OVERRIDE=adwaita
fi
