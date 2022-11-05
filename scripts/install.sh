#!/bin/sh

SCHEMES_PATH=/home/$USER/.var/app/com.raggesilver.BlackBox/data/blackbox/schemes/
SCHEME_FILE_URL=https://raw.githubusercontent.com/ermesonqueiroz/veist-blackbox-theme/main/src/veist.json

flatpak info com.raggesilver.BlackBox >&- 2>&-
if [ $? -eq 0 ]; then
  TMPDIR="$(mktemp -d)"

  printf -- '\n\033[1;92mINSTALLING VEIST THEME...\033[0m\n';
  mkdir -p $SCHEMES_PATH;

  printf -- '\n\033[1;94mDOWNLOADING THEME FILES...\033[0m';
  curl -fsSL -o "$TMPDIR/veist.json" "$SCHEME_FILE_URL"

  printf -- '\n\033[1;94mCOPYING FILES...\033[0m\n\n';
  cp $TMPDIR/* $SCHEMES_PATH;

  printf -- '\033[1;92mINSTALLATION DONE!\033[0m\n\n';
else
  printf -- "\n\033[1;91mINSTALLATION FAILED\033[0m\n\n";
fi
