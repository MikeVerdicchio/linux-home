export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="/home/mike/.oh-my-zsh"

ZSH_THEME="agnoster"
plugins=(zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

eval `dircolors ~/.dircolors`

[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.bash_env ] && source ~/.bash_env
[ -f ~/.bash_functions ] && source ~/.bash_functions
