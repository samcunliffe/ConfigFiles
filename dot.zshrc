# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
