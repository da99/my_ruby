
# === {{CMD}}
# === {{CMD}} -f|--force
gemrc () {
  local +x TEMPLATE="$THIS_DIR"/templates/gemrc
  if [[ -f configs ]]; then
    local +x TARGET=configs/gemrc.yaml
  else
    local +x TARGET=config/gemrc.yaml
  fi

  mkdir -p "$(dirname "$TARGET")"

  if [[ "$@" == *-f* || "$@" == *--force* ]]; then
    rm -f "$TARGET"
  fi

  if [[ ! -f "$TARGET" ]]; then
    cp -i "$TEMPLATE" "$TARGET"
    echo "Wrote to $TARGET"
  else
    echo "File already exists: $TARGET"
  fi

  cat $TARGET
} # === end function
