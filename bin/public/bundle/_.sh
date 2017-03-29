
# === {{CMD}}
bundle () {
    bundle exec gem update --system
    bundle exec gem update
    # This is needed because `bundle update`
    # ignores Gemfile.lock, unlike `bundle install`.
    bundle install
    bundle update
} # === end function
