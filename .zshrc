# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
export PATH="$HOME/.nodenv/shims:$PATH"
eval "$(nodenv init -)"
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# fvm
export PATH="$HOME/.pub-cache/bin:$PATH"
# adb
export PATH="$PATH:/Users/yutaroishiwata/Library/Android/sdk/platform-tools"
# Add diff-highlight
export PATH="$PATH:/usr/local/bin/diff-highlight"
