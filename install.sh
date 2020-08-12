#! /usr/bin/env zsh

ROOT="$HOME/dotfiles"
PREZTO_DIR="${ZDOTDIR:-$HOME}/.zprezto"

echo $PREZTO_DIR
if [ ! -d $PREZTO_DIR ]; then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git $PREZTO_DIR
else
    echo "$PREZTO_DIR already exist, skipping clone."
fi

# setup prompt
ln -sf $ROOT/zprezto/modules/prompt/functions/prompt_yadomi_setup $PREZTO_DIR/modules/prompt/functions/
ln -sf $ROOT/zpreztorc ~/.zpreztorc
ln -sf $ROOT/zshrc ~/.zshrc

# setup git
ln -sf $ROOT/gitconfig ~/.gitconfig

# setup tmux
ln -sf $ROOT/tmux.conf ~/.tmux.conf

# setup vim
ln -sf $ROOT/vimrc ~/.vimrc

# setup private helpers
touch ~/dotfiles/zsh/private/99-private.sh

# set shell to zsh
chsh -s /bin/zsh
