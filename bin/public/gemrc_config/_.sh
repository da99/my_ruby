
# === {{CMD}}
gemrc_config () {
      if [[ ! -f /etc/gemrc ]]
      then
        echo "---" > /tmp/gemrc_temp
        echo ":verbose: true" > /tmp/gemrc_temp
        echo ":sources:" > /tmp/gemrc_temp
        echo "- https://rubygems.org" > /tmp/gemrc_temp
        echo "gem: --no-ri --no-rdoc" > /tmp/gemrc_temp
        echo ":update_sources: true"  > /tmp/gemrc_temp
        sudo mv /tmp/gemrc_temp /etc/gemrc
        echo "Wrote to /etc/gemrc:"
      else
        echo "File already exists: /etc/gemrc"
      fi

      cat /etc/gemrc
} # === end function
