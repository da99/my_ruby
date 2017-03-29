
# === {{CMD}}
gem_install () {
    set "-x"
    trash-put *.gem
    name="$(basename $(pwd))"
    name="$(basename $(pwd))"
    gem build "${name}.gemspec"
    gem install "${name}-$(cat VERSION).gem"
} # === end function
