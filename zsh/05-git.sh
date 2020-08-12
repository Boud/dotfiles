alias git='LANG=en_US.UTF-8 git'
alias gs='git status'
alias gd='git diff'
alias gl='git lg --reverse --color=always --max-count=50 | less +G -R'
alias gds='git diff --staged'

for g in 'gut' 'god' 'giy' 'god' '🐐' 'gt'
{
  alias $g='git'
}
