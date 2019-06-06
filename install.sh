#! /usr/bin/env bash

ROOT=$(dirname "$(readlink -f "$0")")

ln -s $ROOT/prompt_yadomi_setup ~/.zprezto/modules/prompt/functions/prompt_yadomi_setup
ln -s $ROOT/gitconfig ~/.gitconfig
ln -s $ROOT/zpreztorc ~/.zpreztorc
ln -s $ROOT/zshrc ~/.zshrc