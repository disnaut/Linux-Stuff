#!/bin/bash

#Update
sudo apt update && sudo apt upgrade -y

#Install programs
sudo apt install nodejs npm curl python2.7 git libdbusmenu-gtk4 libappindicator1 libunwind-14 libc++abi1-14 gconf-service-backend gconf2-common gconf-service libgconf-2-4 libc++1-14 libc++1 -y

#External Debian Packages
wget https://dl.discordapp.net/apps/linux/0.0.25/discord-0.0.25.deb -O discord.deb #Discord
wget https://az764295.vo.msecnd.net/stable/441438abd1ac652551dbe4d408dfcec8a499b8bf/code_1.75.1-1675893397_amd64.deb -O vs_code.deb
wget https://downloads.mongodb.com/compass/mongodb-mongosh_1.7.1_amd64.deb -O mongodb-compass.deb


sudo dpkg -i *.deb
rm *.deb

#External Tar Packages
wget https://go.dev/dl/go1.20.linux-amd64.tar.gz -O go.tar.gz #Golang
sudo tar -C /usr/local -xzf go1.20.linux-amd64.tar.gz
rm *.tar.gz

#External AppImages
wget https://github.com/laurent22/joplin/releases/download/v2.9.17/Joplin-2.9.17.AppImage -O Joplin.AppImage
sudo chmod +x Joplin.AppImage
mv Joplin.AppImage ~/Desktop/


# Install Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser -y

wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null

echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

sudo apt update && sudo apt install signal-desktop -y


# Install Spotify
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client -y


