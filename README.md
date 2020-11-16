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
$ ln -s ~/Documents/dotfiles/.bashrc ~/
$ ln -s ~/Documents/dotfiles/.zshrc ~/
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

## Install The Silver Searcher
Using [The Silver Searcher](https://github.com/ggreer/the_silver_searcher) to code searching tool.

Install using brew
```
brew install ag
```
## My Cheat Sheets
### Command Cheat Sheets
- [Git Commands](https://github.com/yutaroishiwata/dotfiles/wiki/Git-Commands)
- [Vim Commands](https://github.com/yutaroishiwata/dotfiles/wiki/Vim-Commands)
- [tmux Commands](https://github.com/yutaroishiwata/dotfiles/wiki/tmux-Commands)

### General Settings
- [My Mac Setup](https://github.com/yutaroishiwata/dotfiles/wiki/My-Mac-setup)
