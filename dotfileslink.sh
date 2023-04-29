#!/bin/sh

##########
# set up #
##########

# setup neovim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +qall

# link
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/.clang-format ~/.clang-format
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.hushlogin ~/.hushlogin
