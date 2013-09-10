
###################
#  Sam's .bashrc  #
#   April 2013    #
###################

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source my aliases and a couple of functions
if [ -f ~/.bash/aliases ]; then
	. ~/.bash/aliases
fi

# environmental variables for the names of colours
if [ -f ~/.bash/colours ]; then
	. ~/.bash/colours
fi

# source ubuntu specific aliases
if [[ `lsb_release -i` == "Ubuntu" ]] && [ -f ~/.bash/ubuntu ]
then
	. ~/.bash/ubuntu
fi

# sourch lhcb specific aliases
if [ -f ~/.bash/lhcb ]; then
	. ~/.bash/lhcb
fi

# sourch definitions relevent to this machine
# choose color for the prompt
if [ -f ~/.bash/local ]; then
	. ~/.bash/local
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
    PS1="[\[$LOC_COL\]\u@\h\[$TXT_RST\]:\W]\$ "
  fi;;
*)
  # This shell is not interactive
esac
