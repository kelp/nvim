# NeoVim Setup notes
Some of this comes from [Modern Vim](https://pragprog.com/book/modvim/modern-vim)
Managed with [Homeshick](https://github.com/andsens/homeshick)

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

* Copy Neovim configs to $HOME/.config/nvim/init.vim and run nvim, it should install all the plugins on first run.

If Deoplete isn't working run this:
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

# Misc
* Powerline does not currently work with neovim https://github.com/powerline/powerline/issues/1287 (also it has terrible documentation)

# TODO
~~* Setup linters for go and python~~

* Sync my theme between vim-airline and powerlevel9k

~~* Fix bootstrap, it should auto install vim-pack, load the modules, and make them all work~~

# Notes
* Powerline does not currently work with neovim https://github.com/powerline/powerline/issues/1287 (also it has terrible documentation)
