#!/bin/bash

DOTFILES_DIR="$(cd ./home && pwd)"

for dotfile in "${DOTFILES_DIR}"/.??* ; do
    [[ "$dotfile" == "${DOTFILES_DIR}/.git" ]] && continue
    [[ "$dotfile" == "${DOTFILES_DIR}/.ssh" ]] && continue
    [[ "$dotfile" == "${DOTFILES_DIR}/.DS_Store" ]] && continue
    ln -fnsv "$dotfile" "$HOME"
done

# ssh
mkdir -p ~/.ssh
if [ "$(uname)" == "Darwin" ] ; then
    ln -fnsv  "${DOTFILES_DIR}/.ssh/config" "$HOME/.ssh"
fi

# Java
if [ -e /usr/local/opt/openjdk/libexec/openjdk.jdk ];then
  # Intel mac
  sudo ln -fnsv /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
fi
if [ -e /opt/homebrew/opt/openjdk/libexec/openjdk.jdk ];then
  # M1 mac
  sudo ln -fnsv /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
fi
