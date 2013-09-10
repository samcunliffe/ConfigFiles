ConfigFiles
===========

All my beloved configuration for bash, vim, and python which I keep in version control for:

* ease of update across many machines
* ease of revert when I screw something up
* [git submodules](http://git-scm.com/book/en/Git-Tools-Submodules) of vim plugins and things that I <3

This is probably not interesting for anyone but me: I have moved to the symbolic link approach à la [github.com/rumblesan](http://github.com/rumblesan/dotfiles). So need to make a directory for the git package:

     git clone https://github.com/green0eggs/ConfigFiles

then run 

    ./install.py --help   # read usage
    ./install.py [--repo-dir=/path/to/ConfigFiles] [--home-dir=$HOME]

which makes symbolic links to the project from the home directory.
