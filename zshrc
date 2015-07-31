# ------------------ OH MY ZSH ------------------
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="eastwood"
CASE_SENSITIVE="false"
DISABLE_AUTO_UPDATE="true"
plugins=(git npm node brew gulp ktst)
source $ZSH/oh-my-zsh.sh

# -------------    PATH VARIABLE  ----------------
# Coreutils binaries
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

# Homebrew binaries
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Added by the Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

# RVM
export PATH="$PATH:$HOME/.rvm/bin"

# NVM
export NVM_DIR="/Users/yadomi/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Personal executable scripts
export PATH="$PATH:$HOME/.scripts/bin"

# ------------- Environement variables -----------
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='subl -n'
fi

# Docker
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/yadomi/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

# ------------------ ALIAS -----------------------
source "$HOME/.scripts/my.alias"
source "$HOME/.scripts/kontest.alias"
