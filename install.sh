#!/bin/bash

# copy history template
if [ ! -e ~/.zsh_history ];then
  echo "created .zsh_history"
  cp home/.zsh_history ~/
fi

# Homebrew
if !(type "brew" > /dev/null 2>&1); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null
  source ~/.zshrc
fi
if !(type "brew" > /dev/null 2>&1); then
  echo "brew not found"
  exit 1
fi

# fzf
if !(type "fzf" > /dev/null 2>&1); then
  # fzf: install useful key bindings and fuzzy completion:
  $(brew --prefix)/opt/fzf/install
  source ~/.zshrc
fi
if !(type "fzf" > /dev/null 2>&1); then
  echo "fzf not found"
  exit 1
fi

# npm
if !(type "npm" > /dev/null 2>&1); then
  if [ "$(uname)" == "Linux" ] ; then
      sudo apt-get install -y npm
  fi
  source ~/.zshrc
fi
if !(type "npm" > /dev/null 2>&1); then
  echo "npm not found"
  exit 1
fi

# atcoder-cli
if !(type "acc" > /dev/null 2>&1); then
  npm install -g atcoder-cli
  source ~/.zshrc
fi
if !(type "acc" > /dev/null 2>&1); then
  echo "atcoder-cli not found"
  exit 1
fi

# Vim-plug
if [ ! -e $HOME/.local/share/nvim/site/autoload/plug.vim ];then
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi
if [ ! -e $HOME/.local/share/nvim/site/autoload/plug.vim ];then
  echo "vim-plug not found"
  exit 1
fi

# Tmux-plugin-manager
if [ ! -d ~/.tmux/plugins/tpm ];then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
if [ ! -d ~/.tmux/plugins/tpm ];then
  echo "tpm not found"
  exit 1
fi

# enhancd
if [ ! -d ~/.zsh/enhancd ];then
  git clone https://github.com/b4b4r07/enhancd ~/.zsh/enhancd
fi
if [ ! -d ~/.zsh/enhancd ];then
  echo "enhancd not found"
  exit 1
fi

echo "Installed all!"
