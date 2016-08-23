# ------------------ Prezto ------------------
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source Z
source $(brew --prefix z)/etc/profile.d/z.sh

# Coreutils binaries
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

# Homebrew binaries
export PATH=$HOME/bin:/usr/local/sbin:$PATH

# Android
export PATH="$PATH:$HOME/.opt/android-sdk/platform-tools"

# RVM
export PATH="$PATH:$HOME/.rvm/bin"
source ~/.rvm/scripts/rvm

# NVM
export NVM_DIR="/Users/yadomi/.nvm"
 [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
export NODE_ENV="development"

# Personal executable scripts
export PATH="$PATH:$HOME/.scripts/bin"

# ------------------ Custom Alias ----------------------
source "$HOME/.scripts/my.alias"
source "$HOME/.scripts/krashstudio.alias"
