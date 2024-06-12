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

# source zsh autosuggestions if it's there
if [ -d ~/.zsh/zsh-autosuggestions ]
then
	source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi


## only do echo commands and fancy prompts in interactive mode 
#case "$-" in
#	*i*) PS1=$LOC_COL"%{%G➤%} %f%b";;
#	  *) # This shell is not interactive
#esac


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/mambaforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/mambaforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/mambaforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/mambaforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# OMP - fancy prompts
# https://ohmyposh.dev/
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/ConfigFiles/omp-config.toml)"
fi
