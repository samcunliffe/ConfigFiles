
###################################
##  Sam C's super dooper .bashrc ##
##          June 2012            ##
###################################

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source my preferences
if [ -f ~/.bash_sam ]; then
	. ~/.bash_sam
fi

# sourch lhcb and hep specific aliases
if [ -f ~/.bash_lhcb ]; then
	. ~/.bash_lhcb
fi

# check everything
alias hello=' echo -ne "\nHello, " ; whoami &&
              echo -ne "  You are using \t" ; hostname &&
              echo -ne "  running \t\t" ; lsb_release -sd &&
              echo -ne "  built on kernel\t" ; uname -sr &&
              echo -ne "  Today is \t\t" ; date '

# only do echo commands in interactive mode 
case "$-" in
*i*)
  hello

  # make prompt fancy.
  #   \n puts a return carrage to seperate commands
  #      from one-another. I find this more readable
  #   [user@host:current directory]$
  PS1='\n[\u@\[\033[00;31m\]\h\[\033[00m\]:\W]\$ ';;

*)
  # This shell is not interactive
esac
