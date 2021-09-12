# RVM
source ~/.rvm/scripts/rvm
export PATH="$PATH:$HOME/.rvm/bin"
# Homebrew
typeset -U path PATH
path=(
  /opt/homebrew/bin(N-/)
  /usr/local/bin(N-/)
  $path
)
# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
