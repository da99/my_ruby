
# === {{CMD}} # Installs ruby and gem bin functions.
# === {{CMD}} -f|--force
source "$THIS_DIR"/bin/public/gemrc/_.sh
bin-funcs () {
  local +x ARGS="-i"
  if [[ "$@" == *-f* ]]; then
    ARGS="-f"
  fi

  IFS=$'\n'
  for DIR in $(find "$THIS_DIR"/templates/funcs -mindepth 1 -maxdepth 1 -type d); do
    cp -r $ARGS "$DIR" bin/public/
  done

  if [[ ! -e config/gemrc.yaml && ! -e configs/gemrc.yaml ]]; then
    echo ""
    gemrc
  fi
} # === end function
