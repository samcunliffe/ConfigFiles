
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

# sourch ubuntu sepcific aliases
if [ -f ~/.bash_ubuntu ]; then
	. ~/.bash_ubuntu
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
  #   colour depending on hostname domain
  #
  #   [user@host:current directory]$
  #
  if [[ `hostname -d` == "hep.ph.ic.ac.uk" ]]; then 
    # imperial == red
    PS1='\n[\u@\[\033[00;31m\]\h\[\033[00m\]:\W]\$ '
  elif [[ `hostname -d` == "cern.ch" ]]; then
    # cern == blue
    PS1='\n[\u@\[\033[00;34m\]\h\[\033[00m\]:\W]\$ '
  elif [[ `hostname` == "pclbic02" ]]; then
    # my cern desktop
    PS1='\n[\u@\[\033[01;34m\]\h\[\033[00m\]:\W]\$ '
  else
    # home == yellow
    PS1='\n[${debian_chroot:+($debian_chroot)}\u@\[\033[01;33m\]\h\[\033[00m\]:\W]\$ '
  fi;;
*)
  # This shell is not interactive
esac
