# NeoVim Setup notes
Most of this comes from [Modern Vim](https://pragprog.com/book/modvim/modern-vim)

* Install the python3 provider

`$ pip3 install --user --upgrade neovim`

* Install python-neovim on Arch

`$ pacman -S python-neovim`

* Install neovim remote on macOS

`$ pip3 install --user --upgrade neovim-remote`

* Install neovim-remote on Arch

`$ yay neovim-remote`

* setup youcompleteme
XXX Not using this anymore
* https://valloric.github.io/YouCompleteMe/#mac-os-x

* Install gocode for go completions
`$ go get -u github.com/mdempsky/gocode`

`$ brew install cmake`

Or

`$ sudo pacman -S install cmake`

Then
```
$ cd $HOME/.config/nvim/pack/minpac/start/YouCompleteMe
$ ./install.py --clang-completer --go-completer
```

* setup youcompleteme on Aarch
```
$ sudo pacman -S clang`
$ ./install.py --clang-completer --go-completer --system-libclang
```

## Bootstrap
* Install minpac from: https://github.com/k-takata/minpac
```
git clone https://github.com/k-takata/minpac.git \
    ~/.config/nvim/pack/minpac/opt/minpac
```

* Trying out vim-plug instead
* Install Plug from: https://github.com/junegunn/vim-plug
```
$ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Deplete doesn't seem to work after switching to vim-plug unless you run this:
`
UpdateRemotePlugins
`

# Notes

* Projectionist plugin
https://github.com/tpope/vim-projectionist
lets you load up a .projections.json file that maps a source tree.
Commands like:
```
:Emain
:Emodel author
```
Take you to the appropraite file in the right area. Used to navigate well organized 
code with different directory conventions.

* install fzf on macOS

`$ brew install fzf`

* install fzf on Arch

`$ pacman -S fzf

* install ripgrep on macOS

`$ brew install ripgrep`

* install ripgrep on Arch

`$ pacman -S fzf`

* manage plugins with minpac

`$ mkdir -p $VIMCONFIG/pack/minpac/opt`

* Update plugins

`:PackUpdate`

* Clean plugins

`:PackClean`

* Reload config
```
:write
:source %
```

* generate help for a new plugin

`:helptags ALL`

# Misc
* Powerline does not currently work with neovim https://github.com/powerline/powerline/issues/1287 (also it has terrible documentation)

# TODO
* Setup linters for go and python
* Sync my theme between vim-airline and powerlevel9k

# Notes
* Powerline does not currently work with neovim https://github.com/powerline/powerline/issues/1287 (also it has terrible documentation)
* Fix bootstrap, it should auto install vim-pack, load the modules, and make them all work
