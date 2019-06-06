setopt clobber
setopt alwaystoend

source ~/.zprezto/init.zsh
source /usr/local/opt/z/etc/profile.d/z.sh

alias git='LANG=en_US git'
alias ls='ls --group-directories-first --color=auto -N'
alias lso="ls -alG | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"
alias fuck='sudo $(fc -ln -1)'
alias sha1='openssl sha1'
alias countfiles='find * -maxdepth 1 -type d -not -path '\''*/\.*'\'' |  while read -r dir; do n=$(find "$dir" -type f | wc -l); printf "%4d: %s\n" $n "$dir"; done | sort -r'
alias ip='ipconfig getifaddr en0'
alias qr='qrcode-terminal'

# Unwanted alias
unalias rm
unalias gd
unalias gl

# Git Alias Overide
alias gs='git status'
alias gd='git diff'
alias gl='git lg --reverse --color=always --max-count=50 | less +G -R'
alias gds='git diff --staged'

alias goat='afplay $HOME/.audio/screaming-goat.mp3 &; git'
alias got='afplay $HOME/.audio/got.mp3 &; git' # play Game of Throne theme

for g in 'gut' 'god' 'giy' 'god' '🐐' 'gt'
{
  alias $g='git'
}

# Coreutils binaries
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin" 
export PATH=$PATH:"$HOME/.bin/"

#NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# GPG
export GPG_TTY=$(tty)

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias docker-rmi='docker rmi -f $(docker images -q -f "dangling=true")'
alias rmnodemodules='find . -type d -name "node_modules" -exec rm -rf {} \;'

function chrome-app() {
  "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
    --user-data-dir="$HOME/.chrome-debug-profile" \
    --window-size=400,632 \
    --user-agent="Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1" \
    --auto-open-devtools-for-tabs \
    --app="$1"
}
