
# === {{CMD}}
list () {
    cd /progs/ruby-build
    git pull
    my_ruby update-defs
    /progs/ruby-build/bin/ruby-build --definitions | grep "^[2-9]"
} # === end function
