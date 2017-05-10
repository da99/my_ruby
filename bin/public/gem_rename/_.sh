
# === {{CMD}}  OLD   NEW
gem_rename () {
    old="$(my_ruby instance_name $1)"
    new="$(my_ruby instance_name $2)"
    old_class="$(my_ruby class_name $1)"
    new_class="$(my_ruby class_name $2)"

    if [[ -d "/apps/$old" ]]
    then
      cd /apps
      mv "$old" "$new"
    fi

    cd "/apps/$new"

    for i in $(find . -name "*$1*" -print)
    do
      echo "=== Moving: $old  -->  $new"
      mv -i $i ${i/$old/$new}
    done

    find ./ -type f -not -path "*/.git/*" -exec sed -i 's|'$old'|'$new'|g' {} \;
    find ./ -type f -not -path "*/.git/*" -exec sed -i 's|'${old_class}'|'${new_class}'|g' {} \;

    sed -i 's|'$old'|'$new'|g' .git/config
    if [[ -d .git ]]; then
      echo ""
      git status
    fi
} # === end function
