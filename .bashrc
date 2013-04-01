
####################
#  Sam's .bashrc  ##
#   April 2013    ##
####################

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source my preferences
if [ -f ~/.bash_sam ]; then
	. ~/.bash_sam
fi

# environmental variables for the names of colours
if [ -f ~/.bash_colours ]; then
	. ~/.bash_colours
fi

# sourch definitions relevent to this machine, choose a color for 
# the local fancy prompt
if [ -f ~/.bash_local ]; then
	. ~/.bash_local
fi

# sourch lhcb and hep specific aliases
if [ -f ~/.bash_lhcb ]; then
	. ~/.bash_lhcb
fi

# command to check everything
alias hello=' echo -ne "Hello, " ; whoami &&
              echo -ne "  You are using \t" ; hostname &&
              echo -ne "  running \t\t" ; lsb_release -sd &&
              echo -ne "  built on kernel\t" ; uname -sr &&
              echo -ne "  Today is \t\t" ; date '

# only do echo commands and fancy prompts in interactive mode 
case "$-" in
*i*)
  hello
  echo -ne "Notes:\n"
  cat ~/Notes

  # [user@host:current directory]$
  # make prompt, color depends on domain:
  if [ "$LOC_COL" == "" ]; then
    # no environment variable found,
    # perhaps it wasn't set in .bash_local?
    PS1='[\u@\h:\W]\$ '
  else
    PS1="[$LOC_COL\u@\h$TXT_RST:\W]\$ "
  fi;;
*)
  # This shell is not interactive
esac
