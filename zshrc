setopt clobber
setopt alwaystoend

source ~/.zprezto/init.zsh

alias git='LANG=en_US.UTF-8 git'
alias ls='ls --group-directories-first --color=auto -N'
alias lso="ls -alG | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"
alias fuck='sudo $(fc -ln -1)'
alias ip='curl -s https://api.ipify.org?format=json | jq -cr .ip'
alias qr='qrcode-terminal'
alias docker-rmi='docker rmi -f $(docker images -q -f "dangling=true")'
alias rmnodemodules='find . -type d -name "node_modules" -exec rm -rf {} \;'

# Git Alias Overide
alias gs='git status'
alias gd='git diff'
alias gl='git lg --reverse --color=always --max-count=50 | less +G -R'
alias gds='git diff --staged'

for g in 'gut' 'god' 'giy' 'god' '🐐' 'gt'
{
  alias $g='git'
}

# Coreutils binaries for macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
    export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
fi

# Export some binaries that could be in ~/.bin
export PATH=$PATH:"$HOME/.bin/"

# GPG
export GPG_TTY=$(tty)
