if [ -z "$QT_QPA_PLATFORMTHEME" ] && [ "$XDG_CURRENT_DESKTOP" == "Pantheon" ] then
  export QT_QPA_PLATFORMTHEME=gtk3
fi
