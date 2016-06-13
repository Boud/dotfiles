# ------------------ OH MY ZSH ------------------
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="eastwood"
CASE_SENSITIVE="false"
DISABLE_AUTO_UPDATE="true"
plugins=(git npm node brew ktst z pass)
source $ZSH/oh-my-zsh.sh

# iTerm2 Shell Integration
test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

# -------------    PATH VARIABLE  ----------------
# Coreutils binaries
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

# Homebrew binaries
export PATH=$HOME/bin:/usr/local/sbin:$PATH

# Added by the Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

# RVM
export PATH="$PATH:$HOME/.rvm/bin"

# NVM
export NVM_DIR="/Users/yadomi/.nvm"
export NODE_ENV="development"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Android SDK
export PATH=$PATH:$HOME/.opt/android-sdk/tools
export PATH=$PATH:$HOME/.opt/android-sdk/platform-tools
export ANDROID_HOME=$HOME/.opt/android-sdk/

# Personal executable scripts
export PATH="$PATH:$HOME/.scripts/bin"

# ------------- Environement variables -----------
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='subl -n'
fi

# Docker
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/yadomi/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"

# ------------------ ALIAS -----------------------
source "$HOME/.scripts/my.alias"
source "$HOME/.scripts/krashstudio.alias"