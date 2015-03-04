# ------------------ OH MY ZSH ------------------
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="eastwood"
CASE_SENSITIVE="false"
DISABLE_AUTO_UPDATE="true"
plugins=(git npm node brew)
source $ZSH/oh-my-zsh.sh

# -------------    PATH VARIABLE  ----------------
# Coreutils binaries
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

# Homebrew binaries
export PATH=$HOME/bin:/usr/local/bin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# ------------- Environement variables -----------
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='subl -n'
fi

# ------------------ ALIAS -----------------------
source "$HOME/.scripts/my.alias"
source "$HOME/.scripts/kontest.alias"