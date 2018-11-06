# NeoVim Setup notes
Some of this comes from [Modern Vim](https://pragprog.com/book/modvim/modern-vim)

This is a [homeshick](https://github.com/andsens/homeshick) castle containing my 
Neovim configs.

## Bootstrap

* Install the python3 provider

`$ pip3 install --user --upgrade neovim`

* Install python-neovim on Arch

`$ pacman -S python-neovim`

* Install neovim remote on macOS

`$ pip3 install --user --upgrade neovim-remote`

* Install neovim-remote on Arch

`$ yay neovim-remote`

* Install gocode for go completions
`$ go get -u github.com/mdempsky/gocode`

Bootstrap my [dotfiles](https://github.com/kelp/dotfiles/) and bring in the
nvim castle.

neovim should auto-install all necessary plugins on first boot after that.

Deoplete may complain that you need to run:
`
UpdateRemotePlugins
`

# Notes

My [init.vim](https://github.com/kelp/nvim/blob/master/home/.config/nvim/init.vim)
is fairly well documented now, removing need for much in this README.

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

* Reload config
```
:write
:source %
```

# Misc
* Powerline does not currently work with neovim https://github.com/powerline/powerline/issues/1287 (also it has terrible documentation)

# TODO
~~* Setup linters for go and python~~

* Sync my theme between vim-airline and powerlevel9k

~~* Fix bootstrap, it should auto install vim-pack, load the modules, and make them all work~~
