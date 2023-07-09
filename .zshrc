# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
export PATH="$HOME/.nodenv/shims:$PATH"
eval "$(nodenv init -)"
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# flutter
export PATH="$PATH:$HOME/flutter/bin"
# Add diff-highlight
export PATH="$PATH:/usr/local/bin/diff-highlight"
