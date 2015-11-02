echo "Deleting the old files..."
rm ~/.gitconfig
rm ~/.zshrc

echo "Symlinking files..."
ln -s  $(pwd)/gitconfig    ~/.gitconfig
ln -s  $(pwd)/zshrc        ~/.zshrc
ln -fs $(pwd)/*.alias      ~/.scripts/
ln -s  $(pwd)/oh-my-zsh/*  ~/.oh-my-zsh/
ln -fs $(pwd)/atom/*       ~/.atom/

echo "Everything done :D"
