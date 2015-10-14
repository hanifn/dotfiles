#! /bin/bash
dotfiles=$HOME/.dotfiles
zshrc=$dotfiles/.zshrc
vimrc=$dotfiles/.vimrc
gvimrc=$dotfiles/.gvimrc
ctags=$dotfiles/.ctags
vimfiles=$dotfiles/vim
tmux_conf=$dotfiles/.tmux.conf
tmux_powerline_rc=$dotfiles/.tmux-powerlinerc

# Install AG
brew install the_silver_searcher
sudo brew link pcre xz the_silver_searcher

# Install Exuberant ctags
brew install ctags

[[ ! -e $HOME/.zshrc ]] && ln -s $zshrc $HOME/.zshrc \
  || echo ".zshrc already exists..."

[[ ! -e $HOME/.ctags ]] && ln -s $ctags $HOME/.ctags \
  || echo ".zshrc already exists..."

[[ ! -e $HOME/.vimrc ]] && ln -s $vimrc $HOME/.vimrc \
  || echo ".vimrc already exists..."

#[[ ! -e $HOME/.gvimrc ]] && ln -s $gvimrc $HOME/.gvimrc \
  #|| echo ".gvimrc already exists..."

[[ ! -e $HOME/.vim ]] && ln -s $vimfiles $HOME/.vim \
  || echo ".vim already exists..."

echo "Done"

# Make sure bundle folder exists
[[ ! -e $vimfiles/bundle ]] && mkdir $vimfiles/bundle

# Install Vundle first
git clone https://github.com/VundleVim/Vundle.vim.git \
    ~/.vim/bundle/Vundle.vim

# Install plugins via Vundle
vim +PluginInstall +qall

# Install CMake to compile YCM
brew install CMake
sudo brew link CMake

# Compile YouCompleteMe
cd $vimfile/bundle/YouCompleteMe
./install.py --clang-completer
