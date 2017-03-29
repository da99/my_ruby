
# === {{CMD}}   # Checks if .rb files contain aputs, puts, binding.pry
ruby_clean () {
    PATH="$PATH:$THIS_DIR/../bash_setup/bin"
    bash_setup files_zero aputs '*.rb'
    bash_setup files_zero puts  '*.rb'
    bash_setup files_zero binding.pry  '*.rb'
} # === end function
