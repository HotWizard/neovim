dirs=("$HOME/.config/nvim" "$HOME/.local/share/nvim" "squashfs-root" "/squashfs-root" "$HOME/.local/state/nvim" "$HOME/.cache/nvim")
executable_dirs=("/usr/local/bin/nvim" "/usr/bin/nvim")

for executable in "${executable_dirs}"; do
    if [ -e "$executable" ]; then
        sudo rm -rf "$executable"
    fi
done

for dir in "${dirs[@]}"; do
    if [ -d "$dir" ]; then
        sudo rm -rf "$dir"
    fi
done

# NVM
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
source ~/.bashrc

# Installing Node.js and yarn
nvm install node
node -v
npm -v
npm i -g yarn clangd marksman

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> $HOME/.bashrc
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.bashrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew install lua-language-server marksman

# Downloading neovim and exposing neovim globally.
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
rm -rf nvim.appimage
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

cp -R ".config/nvim" "$HOME/.config/"

nvim
