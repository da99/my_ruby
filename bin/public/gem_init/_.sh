
# === {{CMD}}
# === {{CMD}}  bitbucket
# ===
# === === Create a gem: =========
# === -- create repo @ github.com
# === $ mkdir  my_new_gem
# === $ cd     my_new_gem
# === ===========================
gem_init () {

    echo ""
    export name="$(basename $(pwd))"
    export NAME="$(ruby_setup class_name $name)"
    export today="$(date +"%Y-%m-%d")"
    export year="$(date +"%Y")"
    export user="$(git config --global user.name)"
    export email="$(git config --global user.email)"
    gemspec="${name}.gemspec"

    if [[ -z "$@" ]]; then
      export repo="github"
      export homepage="https://github.com/${user}/${name}"
      export repo_git="git@github.com:${user}/${name}.git"
    else
      export repo="bitbucket"
      export homepage="https://bitbucket.org/da99/${name}"
      export repo_git="git@bitbucket.org:${user}/${name}.git"
    fi

    mkdir -p specs/lib
    mkdir -p lib
    mkdir -p bin

    ruby_setup template $TEMPLATES/Gemfile     Gemfile
    ruby_setup template $TEMPLATES/LICENSE     LICENSE
    ruby_setup template $TEMPLATES/README.md   README.md
    ruby_setup template $TEMPLATES/the.gemspec ${name}.gemspec
    ruby_setup template $TEMPLATES/VERSION     VERSION
    ruby_setup template $TEMPLATES/.gitignore  .gitignore
    ruby_setup template $TEMPLATES/lib.rb      lib/${name}.rb
    ruby_setup template $TEMPLATES/helpers.rb  specs/lib/helpers.rb

    ruby_setup template $TEMPLATES/name        bin/${name}
    chmod +x bin/${name}

    # === Create a default test file if no other test files exist.
    if [[ "$(echo -n specs/*.rb)" == "" ]]; then
      ruby_setup template $TEMPLATES/first_test.rb specs/${name}.rb
    fi

    if [[ ! -d .git ]]; then
      git init
    fi

    if [[ -z "$(git remote -v)" ]]; then
      my_git update
      git commit -m "Init."
      git remote add origin $repo_git
    fi

    colorize green "=== Done gem init: $name"
} # === end function
