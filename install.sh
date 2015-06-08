echo "Deleting the old files..."
rm ~/.gitconfig
rm ~/.zshrc

echo "Symlinking files..."
mkdir -p $(pwd)/.scripts/
ln -s $(pwd)/gitconfig  ~/.gitconfig
ln -s $(pwd)/zshrc      ~/.zshrc
ln -s $(pwd)/*.alias    ~/scripts
ln -s $(pwd)/oh-my-zsh  ~/.oh-my-zsh

echo "Everything done :D"