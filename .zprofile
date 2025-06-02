# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# rbenv
eval "$(rbenv init - --no-rehash zsh)"
