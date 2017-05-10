
# === {{CMD}}   # Checks if .rb files contain aputs, puts, binding.pry
ruby_clean () {
    PATH="$PATH:$THIS_DIR/../my_bash/bin"
    files_zero aputs '*.rb'
    files_zero puts  '*.rb'
    files_zero binding.pry  '*.rb'
} # === end function
