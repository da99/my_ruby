
# === {{CMD}}  ...
gem () {
  unset -f gem
  if [[ ! -z "$@" && "$1" == install ]]; then
    shift
    gem install --no-rdoc --no-ri "$@"
    return 0
  fi

  gem "$@"
} # === end function
