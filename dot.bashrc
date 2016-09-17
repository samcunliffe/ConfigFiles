# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]
then
	. /etc/bashrc
fi

# Source my aliases and a couple of functions
if [ -f ~/.bash/aliases ]
then
	. ~/.bash/aliases
fi

# environmental variables for the names of colours
if [ -f ~/.bash/colours ]
then
	. ~/.bash/colours
fi

# source ubuntu specific aliases
if [ -f ~/.bash/ubuntu ]
then
	if [[ `lsb_release -is` == "Ubuntu" ]] || [[ `lsb_release -is` == "LinuxMint" ]]
	then
		. ~/.bash/ubuntu
	fi
fi

# sourch Belle II specific aliases
if [ -f ~/.bash/belle2 ]
then
	. ~/.bash/belle2
fi

# sourch definitions relevent to this machine
# choose color for the prompt
if [ -f ~/.bash/local ]
then
	. ~/.bash/local
fi


# command to check everything
hello() {
	printf "Hello, %s\n" $(whoami)
	printf "Today is\t%s\n" "$(date)"
	printf "You're using\t%s on %s\n" "$(lsb_release -sd)" "$(hostname)"
	printf "Kernel version\t%s\n" "$(uname -r)"
	printf "GCC version\t%s\n" "$(gcc -dumpversion)"
	printf "python version\t"
	# python -V is a total pain and needs to have the stream redirected
	# also, it already terminates in a '\n' newline so just take the
        # output from sed
	sed 's/[A-Za-z ]//g' <<< "$(python --version 2>&1)"
	printf "ROOT version\t%s\n" "$(root-config --version)"
	printf "ghc version\t" 
	sed 's/[A-Za-z ,]//g' <<< $(ghc --version)
}

# only do echo commands and fancy prompts in interactive mode 
case "$-" in
*i*)
  hello
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
