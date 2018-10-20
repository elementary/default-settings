#!/bin/bash

# Translators: These are folders to save screen-shots and webcam videos
SCREENSHOT_FOLDER=Screenshots
WEBCAM_FOLDER=Webcam

check_for_user_dirs_file () {
  if [ ! -f ${XDG_CONFIG_HOME:-~/.config}/user-dirs.dirs ]
  then
    echo >&2 "~/.config/user-dirs.dirs does not exist"
    exit 1
  fi
}

read_user_dirs_file () {
  source ${XDG_CONFIG_HOME:-~/.config}/user-dirs.dirs
  PICTURES_FOLDER=${XDG_PICTURES_DIR:-$HOME}
  VIDEOS_FOLDER=${XDG_VIDEOS_DIR:-$HOME}
}

create_dirs_if_missing () {
  mkdir -p $PICTURES_FOLDER/$SCREENSHOT_FOLDER
  mkdir -p $VIDEOS_FOLDER/$WEBCAM_FOLDER
}

export_envars () {
  export PANTHEON_SCREENSHOTS_DIR=$PICTURES_FOLDER/$SCREENSHOT_FOLDER
  export PANTHEON_WEBCAM_DIR=$VIDEOS_FOLDER/$WEBCAM_FOLDER
}

check_for_user_dirs_file
read_user_dirs_file
create_dirs_if_missing
export_envars
