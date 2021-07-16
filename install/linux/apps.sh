#installing the esentials for ubuntu
sudo apt-get update
sudo apt-get install build-essential
sudo apt install htop tmux install curl git
sudo snap install --classic code # or code-insiders
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting" --depth 1
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1
