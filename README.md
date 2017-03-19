samcunliffe/ConfigFiles
=======================

These are my dotfiles, there are many like them but these are mine.

This is probably not interesting for anyone but me: I symbolic link all the dotfiles (à la [rumblesan](http://github.com/rumblesan/dotfiles)) from my home directory to here.

I try to use minimal vim plugins.
For plugins I **do** use, I use [pathogen](https://github.com/tpope/vim-pathogen) since it allows me to have plugins organised in the `dot.vim/bundle` directory (and not have everything dumped into `autoload`).
I prefer pathogen to [vundle](https://github.com/VundleVim/Vundle.vim) since this way I can use `git submodule`s myself to keep track of my plugins rather than have vundle go away and clone things for me.
