
# === {{CMD}}  major|minor|patch
bump_commit_push () {
    ruby_setup ruby_clean
    git_is_clean
    bundle update
    if [[ -f "bin/test" ]]; then
      bin/test
    else
      "bin/$(basename "$(pwd)")" test
    fi

    $0 bump $@

    VER=$(cat VERSION)
    git_setup update
    git commit -m   "Bump: $VER"
    git tag         "v$VER"
    git push
    git push origin "v$VER"
} # === end function
