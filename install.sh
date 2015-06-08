echo "Deleting the old files..."
rm ~/.gitconfig
rm ~/.zshrc

echo "Symlinking files..."
ln -s $(pwd)/gitconfig  ~/.gitconfig
ln -s $(pwd)/zshrc      ~/.zshrc
ln -fs $(pwd)/*.alias   ~/.scripts/

echo "Everything done :D"