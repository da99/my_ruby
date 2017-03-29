
# === {{CMD}}  my_class_something  # Prints My_Class_Something
class_name () {
  ruby -e "puts ARGV[0].downcase.split('_').map(&:capitalize).join('_')" "$@"
} # === end function
