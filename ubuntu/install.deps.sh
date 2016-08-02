
# === https://github.com/wayneeseguin/rvm/blob/master/scripts/functions/requirements/ubuntu
# === https://github.com/sstephenson/ruby-build/wiki
echo "=== Updating system using apt-get:"
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git      \
  curl gawk zlib1g-dev        \
  build-essential libssl-dev  \
  libreadline-dev libyaml-dev \
  libsqlite3-dev sqlite3      \
  libxml2-dev libxslt-dev     \
  bash curl patch bzip2 ca-certificates gawk                        \
  g++ gcc make libc6-dev patch openssl ca-certificates libreadline6 \
  libreadline6-dev curl zlib1g zlib1g-dev libssl-dev libyaml-dev    \
  libsqlite3-dev sqlite3 autoconf                                   \
  libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev \
  make libc6-dev patch openssl ca-certificates libreadline6         \
  libreadline6-dev curl zlib1g zlib1g-dev libssl-dev libyaml-dev    \
  libsqlite3-dev sqlite3 autoconf                                   \
  libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev \
  autoconf bison build-essential                                    \
  libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev           \
  libedit-dev                                                       \
  libcurl4-openssl-dev
