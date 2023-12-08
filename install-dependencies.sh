#!/usr/bin/env bash
#

SCRIPT_FOLDER=$(pwd)
INSTALL_FOLDER=~/Downloads

echo "[*] Updating and Upgrading OS system..."

cd $INSTALL_FOLDER

sudo apt update -y
sudo apt upgrade -y
sudo apt update -y

echo "[*] Installing apt packages..."

cd $INSTALL_FOLDER

sudo apt install -y build-essential cmake cmake-data git libasound2-dev libcairo2-dev libconfig-dev libdbus-1-dev libev-dev libevdev-dev libgl1-mesa-dev libjsoncpp-dev libmpdclient-dev libnl-genl-3-dev libpcre2-dev libpixman-1-dev libpulse-dev libuv1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-cursor-dev libxcb-damage0-dev libxcb-ewmh-dev libxcb-glx0-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-keysyms1-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util0-dev libxcb-xfixes0-dev libxcb-xinerama0-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-xtest0-dev libxext-dev libxinerama1 libxinerama-dev meson pkg-config python3-sphinx python3-xcbgen uthash-dev vim xcb-proto rofi feh imagemagick scrub neofetch flameshot ranger

echo "[*] Installing bspwm and sxhkd..."

cd $INSTALL_FOLDER

git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git

cp -r $SCRIPT_FOLDER/bspwm ~/.config
cp -r $SCRPT_FOLDER/sxhkd ~/.config

cd bspwm & make & sudo make install
cd ../sxhkd & make & sudo make install

cd ..
cp -r ./bspwm ~/.config
cp -r ./sxhkd ~/.config

sudo apt install bspwm

echo "[*] Installing Polybar..."

cd $INSTALL_FOLDER

git clone –recursive https://github.com/polybar/polybar
cd polybar
mkdir build
cd build
cmake ..
make-j$(nproc)
sudo make install

cp $SCRIPT_FOLDER/polybar ~/.config
mkdir ~/.target
touch ~/.target/target

echo "[*] Installing Picom..."

cd $INSTALL_FOLDER

git clone https://github.com/ibhagwan/picom.git
cd picom
git submodule update –init –recursive
meson –buildtype=release . build
ninja -C build
sudo ninja -C build install

cp -r $SCRIPT_FOLDER/picom ~/.config

echo "[*] Installing wallpaper..."

cd $INSTALL_FOLDER

cp -r $SCRIPT_FOLDER/pictures/bg.png ~/Picture

echo "[*] Configuring Kitty"

cp -r $SCRIPT_FOLDER/kitty ~/.config

echo "[*] Installing Hack Nerd Font"

cd $INSTALL_FOLDER

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip
sudo unzip Hack.zip -d /usr/local/share/fonts


echo "[*] Installing zsh-plugins"

cd $INSTALL_FOLDER

sudo apt install zsh-autosuggestions zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
wget https://github.com/sharkdp/bat/releases/download/v0.24.0/bat_0.24.0_amd64.deb
sudo dpkg -i bat_0.24.0_amd64.deb
wget https://github.com/lsd-rs/lsd/releases/download/v1.0.0/lsd_1.0.0_amd64.deb
sudo dpkg -i lsd_1.0.0_amd64.deb
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

sudo mkdir /usr/share/zsh-sudo
cd /usr/share/zsh-sudo
sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh
cd $INSTALL_FOLDER

cp $SCRIPT_FOLDER/.zshrc ~/.zshrc
cp $SCRIPT_FOLDER/.p10k.zsh ~/.p10k.zsh

sudo ln -s -f /home/looping/.p10k.zsh /root/.p10k.zsh
sudo ln -s -f /home/looping/.zshrc /root/.zshrc
sudo ln -s -f /home/looping/.config /root/.config
sudo ln -s -f /home/looping/.fzf /root/.fzf
sudo ln -s -f /home/looping/.fzf.zsh /root/.fzf.zsh

echo "[*] Installing NeoVim"

cd $INSTALL_FOLDER
git clone https://github.com/NvChad/NvChad ~/.config/nvim
cd /opt
sudo wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
sudo tar -xvf nvim-linux64.tar.gz
sudo rm nvim-linux64.tar.gz

echo "[*] Installing Seclists"

cd /opt 
sudo git clone https://github.com/danielmiessler/SecLists.git
sudo ln -s /opt/SecLists /usr/share/wordlists/
