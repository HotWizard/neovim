if [ -e "/usr/local/bin/nvim" ]; then
    sudo rm -rf "/usr/local/bin/nvim"
fi

if test -f "/usr/bin/nvim"; then
    sudo rm -rf "/usr/bin/nvim"
fi

if [ -d "$HOME/.config/nvim" ]; then
    rm -rf "$HOME/.config/nvim"
fi

if [ -d "$HOME/.local/share/nvim" ]; then
    rm -rf "$HOME/.local/share/nvim"
fi

if [ -d "squashfs-root" ]; then
    rm -rf "squashfs-root"
fi

if [ -d "/squashfs-root" ]; then
    sudo rm -rf "/squashfs-root"
fi

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Installing Node.js and yarn
nvm install node
node -v
npm -v
npm install --global yarn

# Downloading neovim and exposing neovim globally.
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
rm -rf nvim.appimage
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

cp -R ".config/nvim" "$HOME/.config/"

nvim -c "CocInstall coc-json coc-tsserver coc-clangd coc-lua \
         coc-sh coc-markdownlint coc-html coc-pyright"
