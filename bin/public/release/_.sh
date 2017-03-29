
# === {{CMD}}
release () {
    rm -f ./*.gem
    git_is_clean
    gem build ./*.gemspec
    gem push "$(echo ./*.gem)"

    # This is done last in case the gem has errors,
    #  like "FIXME" or "TODO" in the gemspec.
    git push origin "v$(cat VERSION)"
    git push
} # === end function
