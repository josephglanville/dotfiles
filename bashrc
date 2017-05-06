# $HOME/.bashrc
# Author: joseph.glanville@orionvm.com.au

export PATH="$PATH:$HOME/bin"
export EDITOR="vim"

source $HOME/.mpdrc

## Check for an interactive session
[ -z "$PS1" ] && return

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

# colored prompt
if [ "`tput colors`" = "256" ]; then
  B="\e[0;38;5;67m"
  G="\e[0;38;5;114m"
  Y="\e[0;38;5;214m"
else
  B="\e[0;34m"
  G="\e[0;32m"
  Y="\e[0;33m"
fi

W="\e[0m"

PS1="\[$B\]┌─\[$W\][ \[$Y\]\A \[$W\]][ \[$G\]\h:\w \[$W\]]\n\[$B\]└─\[$Y\]> \[$W\]"

# Prepend $HOME/bin to PATH
export PATH="${HOME}/bin:${PATH}"

# Set GOPATH to go workspace
export GOPATH="$HOME/go"
# Prepend GOPATH/bin to PATH
export PATH="$GOPATH/bin:$PATH"

# Set editor
export EDITOR="vim"

# Setup rbenv if installed
if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# Setup fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Platform specific zsh configuration
[ -f ~/.zshrc.linux ] && source ~/.zshrc.linux
[ -f ~/.zshrc.mac ] && source ~/.zshrc.mac
