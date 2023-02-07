# dotfiles

## Install
```
$ git clone git@github.com:yutaroishiwata/dotfiles.git ~/Documents/dotfiles
```

## Create Symbolic Link
```
$ ln -s ~/Documents/dotfiles/.vimrc ~/
$ ln -s ~/Documents/dotfiles/.gvimrc ~/
$ ln -s ~/Documents/dotfiles/.tmux.conf ~/
$ ln -s ~/Documents/dotfiles/.zshrc ~/
$ ln -s ~/Documents/dotfiles/.tigrc ~/
$ ln -s ~/Documents/dotfiles/.gitconfig ~/
$ ln -s ~/Documents/dotfiles/.gitignore_global ~/
```

## vim-plug Setup
Using [vim-plug](https://github.com/junegunn/vim-plug) to manage VIM plugins.
```
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Install plugins
```
:PlugInstall
```

## Install tig
Using [tig](https://jonas.github.io/tig/) to manipulate git repositories on CLI.

Install using brew
```
brew install tig
```

## Install The Silver Searcher
Using [The Silver Searcher](https://github.com/ggreer/the_silver_searcher) to code searching tool.

Install using brew
```
brew install ag
```

## Appearance
- Font: [Source Code Pro](https://github.com/adobe-fonts/source-code-pro)
- Color scheme: [One Half](https://github.com/sonph/onehalf)

## My Cheat Sheets
### Command Cheat Sheets
- [Git Commands](https://github.com/yutaroishiwata/dotfiles/wiki/Git-Commands)
- [Vim Commands](https://github.com/yutaroishiwata/dotfiles/wiki/Vim-Commands)
- [tmux Commands](https://github.com/yutaroishiwata/dotfiles/wiki/tmux-Commands)

### General Settings
- [My Mac Setup](https://github.com/yutaroishiwata/dotfiles/wiki/My-Mac-setup)
