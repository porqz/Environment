# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="prqz"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx brew)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi

alias nginx="chmod -R 777 ~/Sites; sudo /usr/local/bin/nginx"
alias v="mvim"
alias g="git"
alias l="ls -la"

alias o3="cd /var/www/applications/online3"
alias o4="cd ~/Desktop/online4"
alias o4m="cd ~/Desktop/online4/modules"


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

PATH=/usr/local/sbin:$PATH
PATH=/usr/local/bin:$PATH
PATH=/usr/local/share/npm/bin:$PATH
PATH=/usr/local/Cellar/php55/5.5.6/bin:$PATH

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
