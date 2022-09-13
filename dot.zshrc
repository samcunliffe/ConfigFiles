# .zshrc

# Source my aliases and a couple of functions: bash aliases all work
if [ -f ~/.bash/aliases ]
then
	. ~/.bash/aliases
fi

if hash lsb_release 2>/dev/null;
then
	# Source some aliases for ubuntu only
	if [ -f ~/.bash/ubuntu ]
	then
		. ~/.bash/ubuntu
	fi
else
	# Source some aliases for mac only
	if [ -f ~/.bash/apple ]
	then
		. ~/.bash/apple
	fi
fi

# sourch definitions relevent to this machine
# choose color for the prompt
if [ -f ~/.bash/local ]
then
	. ~/.bash/local
fi

# command to check everything
hello() {
	# if linux: what kernel, if mac: what osx version
	if hash lsb_release 2>/dev/null; then
		swvers="$(lsb_release -sd)" 
	else
		swvers="$(sw_vers -productName) $(sw_vers -productVersion)"
	fi
	# a nice greeting
	printf "Hello, %s\n" $(whoami)
	printf "Today is\t%s\n" "$(date)"
	printf "You're using\t%s on %s\n" "$swvers" "$(hostname)"
	printf "Kernel version\t%s\n" "$(uname -r)"
	printf "Architecture\t%s\n" "$(arch)"
	printf "GCC version\t%s\n" "$(gcc -dumpversion)"
	printf "python3 version\t"
	# python -V and gch are a total pain and needs to have the stream
	# redirected also, it already terminates in a '\n' newline so just take
	# the output from sed
	sed 's/[A-Za-z ]//g' <<< "$(python3 --version 2>&1)"
	printf "ghc version\t" 
	sed 's/[A-Za-z ,]//g' <<< $(ghc --version)
}

# only do echo commands and fancy prompts in interactive mode 
case "$-" in
	*i*) PS1=$LOC_COL"➤ %f%b";;
	  *) # This shell is not interactive
esac

