#! /usr/bin/env zsh

ROOT=$(readlink -f $(dirname "$0"))
PREZTO_DIR="${ZDOTDIR:-$HOME}/.zprezto"

if [ ! -d $PREZTO_DIR ]; then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git $PREZTO_DIR
else
    echo "$PREZTO_DIR already exist, skipping clone."
fi

ln -sf $ROOT/gitconfig ~/.gitconfig

ln -sf $ROOT/zprezto/modules/prompt/functions/prompt_yadomi_setup $PREZTO_DIR/modules/prompt/functions/
ln -sf $ROOT/zpreztorc ~/.zpreztorc
ln -sf $ROOT/zshrc ~/.zshrc

chsh -s /bin/zsh
