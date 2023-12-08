#!/usr/bin/env bash
#

SCRIPT_FOLDER=$(pwd)

echo "[*] Updating and Upgrading OS system..."

sudo apt update -y
sudo apt upgrade -y
sudo apt update -y

echo "[*] Installing apt packages..."

cd ~/Downloads/

sudo apt install build-essential cmake cmake-data git libasound2-dev libcairo2-dev libconfig-dev libdbus-1-dev libev-dev libevdev-dev libgl1-mesa-dev libjsoncpp-dev libmpdclient-dev libnl-genl-3-dev libpcre2-dev libpixman-1-dev libpulse-dev libuv1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-cursor-dev libxcb-damage0-dev libxcb-ewmh-dev libxcb-glx0-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-keysyms1-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util0-dev libxcb-xfixes0-dev libxcb-xinerama0-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-xtest0-dev libxext-dev libxinerama1 libxinerama-dev meson pkg-config python3-sphinx python3-xcbgen uthash-dev vim xcb-proto rofi

echo "[*] Installing bspwm and sxhkd..."

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

git clone –recursive https://github.com/polybar/polybar
cd polybar
mkdir build
cd build
cmake ..
make-j$(nproc)
sudo make install

cp $SCRIPT_FOLDER/polybar ~/.config

echo "[*] Installing Picom..."

cd ../..
git clone https://github.com/ibhagwan/picom.git
cd picom
git submodule update –init –recursive
meson –buildtype=release . build
ninja -C build
sudo ninja -C build install

cp -r $SCRIPT_FOLDER/picom ~/.config

echo "[*] Installing wallpaper..."

cd ~/Downloads
cp -r $SCRIPT_FOLDER/pictures/bg.png ~/Picture

echo "[*] Configuring Kitty"

cp -r $SCRIPT_FOLDER/kitty ~/.config

echo "[*] Installing Hack Nerd Font"

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip
sudo unzip Hack.zip -d /usr/local/share/fonts





