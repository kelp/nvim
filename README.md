# NeoVim Setup notes
Most of this comes from [Modern Vim](https://pragprog.com/book/modvim/modern-vim)

# Install the python3 provider
pip3 install --user --upgrade neovim

# Install neovim remote
pip3 install --user --upgrade neovim-remote

# install vim-unimpared
mkdir -p $VIMCONFIG/pack/bundle/start
cd $VIMCONFIG/pack/bundle/start
git clone https://github.com/tpope/vim-unimpaired.git

# Install scriptease optional.
# To load it :packadd vim-scriptease
mkdir -p $VIMCONFIG/pack/bundle/op
cd $VIMCONFIG/pack/bundle/opt
git clone https://github.com/tpope/vim-scriptease.git

# Projectionist plugin
https://github.com/tpope/vim-projectionist
lets you load up a .projections.json file that maps a source tree.
Commands like:
:Emain
:Emodel author
Take you to the appropraite file in the right area. Used to navigate well organized 
code with different directory conventions.

# install fzf on eacOS
brew install fzf

# install ripgrep
brew install ripgrep

# manage plugins with minpac
mkdir -p $VIMCONFIG/pack/minpac/opt

# Update plugins
:PackUpdate

# Clean plugins
:PackClean

# Reload config
:write
:source %

# generate help for a new plugin
helptags ALL

# TODO
* Setup linters for go and python
