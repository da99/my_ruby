
# === {{CMD}}
update-defs () {
    cd /progs
    if [[ ! -d /progs/ruby-build ]]; then
      git clone https://github.com/sstephenson/ruby-build.git
    fi
    cd ruby-build
    git pull
} # === end function
