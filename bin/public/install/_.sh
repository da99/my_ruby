
# === {{CMD}}         # Install latest ruby possible
# === {{CMD}}  x.x.x
install () {
    if lsb_release -a | grep Void &>/dev/null ; then
      if [[ ! -z "$@" ]]; then
        echo "!!! You are using a Void Linux distro." >&2
        echo "!!! These args are useless: $@" >&2
        exit 1
      fi

      echo "=== Installing ruby through XBPS:"
      sudo xbps-install -S ruby ruby-devel
      return 0
    fi

    if [[ -z "$@" ]]; then
      my_gems=/progs/ruby/my_gems
      mkdir -p "$my_gems"
      bash_setup make_link "$my_gems" $HOME/.gem
      if ! gem list -i curses; then
        gem install --user-install curses # Needed for fzf
      fi

      exit 0
    fi

    cd /progs/ruby-build
    git pull


    case "$(mksh_setup os-name)" in
      "Arch")
        sudo pacman -S base-devel libffi libyaml openssl zlib
        ;;
      "Ubuntu")
        source "$THIS_DIR/ubuntu/install.deps.sh"
        ;;
      *)
        sh_color RED "=== Unknown os: {{$(lsb_release -a)}}"
        exit 1
    esac

    if [[ -z "$@" ]]; then
      my_ruby list
      echo "=== Choose one from the top."
      exit 0
    fi

    if [[ -z "$@" ]]
    then
      ver="$(/progs/ruby-build/bin/ruby-build --definitions | grep '^[0-9]\+\.[0-9]\+\.[0-9]\+$' | tail -n 1)"
    else
      ver="$1"
    fi

    if [[ -d /progs/ruby/$ver ]]; then
      echo "=== Aborting: Already exists: /progs/ruby/$ver"
      exit 0
    fi

    # ================ The Main Show ======================
    sh_color BOLD "=== THIS IS GOING TO TAKE ABOUT {{5-10 mins}}...."
    CONFIGURE_OPTS="--enable-shared --disable-install-doc" \
      /progs/ruby-build/bin/ruby-build $ver /progs/ruby/$ver
    # =====================================================


    echo "=== Linking $ver as current ruby:"
    rm -f /progs/ruby/current
    ln -s /progs/ruby/$ver  /progs/ruby/current

    echo "=== Updating gems:"
    gem update --system
    gem update --no-document
    gem install bundler --no-document
    gem install bump    --no-document
    gem install pry     --no-document
    my_ruby  gemrc_config

    echo "=== Done installing."
    ruby -v
} # === end function
