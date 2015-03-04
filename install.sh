echo "Deleting the old files..."
rm ~/.gitconfig
rm ~/.zshrc

echo "Symlinking files..."
mkdir -p $(pwd)/.scripts/
ln -s $(pwd)/.gitconfig ~/.gitconfig
ln -s $(pwd)/.zshrc     ~/.zshrc

echo "Everything done :D"