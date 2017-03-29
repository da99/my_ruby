
# === {{CMD}}  file output
template () {
    file="$1"
    output="$2"
    ruby_template='
      file  = ARGV[0]
      tmpl  = File.read(file)
      puts(tmpl.gsub(/{{([^}]+)}}/) do |match|
        raise "Var not found: #{$1}" unless ENV[$1]
        ENV[$1]
      end)
    '

    if [[ -f $output ]]; then
      colorize yellow "=== Skipping existing file: $output"
      exit 0
    fi

    # Note: eval and write the content separately.
    # If you combine those two steps, and an error
    # occurs during eval, an empty file will be created:
    #   ruby "error" >> $output
    content="$(ruby -e "$ruby_template" "$file")"
    echo "$content" >> "$output"
    colorize green "=== Wrote: $output"
} # === end function
