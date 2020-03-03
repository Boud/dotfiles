#! /usr/bin/env bash

ROOT=$(readlink -f $(dirname "$0"))

# git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# ln -s $ROOT/.zprezto/modules/prompt/functions/prompt_yadomi_setup .zprezto/modules/prompt/functions/
ln -s $ROOT/.gitconfig ~/
# ln -s $ROOT/.zpreztorc ~/
# ln -s $ROOT/.zshrc ~/