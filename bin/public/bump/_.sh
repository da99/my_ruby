
# === {{CMD}}  current|...
bump () {
  unset -f bump
  if [[ -z "$(which bump)" ]]; then
    echo "!!! install rubygem: gem install bump"
    exit 1
  fi
  if [[ "$1" != "current" ]]; then
    git_is_clean
    echo -e "=== Bumping from: $(bump current)\n"
  fi
  bump $1 --no-commit --no-bundle
} # === end function
