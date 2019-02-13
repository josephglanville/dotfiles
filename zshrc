# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="prose"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx gradle kube-ps1)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all
setopt EXTENDED_GLOB

# Prepend $HOME/bin to PATH
export PATH="${HOME}/bin:${PATH}"

# Set GOPATH to go workspace
export GOPATH="$HOME/go"
# Prepend GOPATH/bin to PATH
export PATH="$GOPATH/bin:$PATH"

# If in a virtualenv then add virtualenv/bin to PATH
if [ -d $VIRTUAL_ENV ]; then
  export PATH="$VIRTUAL_ENV/bin:$PATH"
fi

# Set editor
export EDITOR="vim"

# Setup rbenv if installed
if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# Setup direnv
[ -f /usr/local/bin/direnv ] && eval "$(direnv hook zsh)"

# Platform specific zsh configuration
[ -f ~/.zshrc.linux ] && source ~/.zshrc.linux
[ -f ~/.zshrc.mac ] && source ~/.zshrc.mac

# Setup fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
