# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# Homebrew
typeset -U path PATH
path=(
  /opt/homebrew/bin(N-/)
  /usr/local/bin(N-/)
  $path
)
# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
