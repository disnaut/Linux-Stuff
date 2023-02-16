#!/bin/bash

#Update
sudo apt update && sudo apt upgrade -y
sudo apt install curl

curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

#Install programs
sudo apt install python2.7 libdbusmenu-gtk4 libappindicator1 libunwind-14 libc++abi1-14 gconf-service-backend gconf2-common gconf-service libgconf-2-4 libc++1-14 libc++1 qbittorrent -y

sudo dpkg --add-architecture i386 -y
sudo apt update
sudo apt install wget gdebi-core libgl1-mesa-glx:i386 -y

#External Debian Packages
wget https://dl.discordapp.net/apps/linux/0.0.25/discord-0.0.25.deb -O discord.deb #Discord

wget https://az764295.vo.msecnd.net/stable/441438abd1ac652551dbe4d408dfcec8a499b8bf/code_1.75.1-1675893397_amd64.deb -O vs_code.deb #VS_Code

wget https://downloads.mongodb.com/compass/mongodb-mongosh_1.7.1_amd64.deb -O mongodb-compass.deb #Mongosh which isn't what I am trying to do... i think

wget -O ~/steam.deb http://media.steampowered.com/client/installer/steam.deb

sudo dpkg -i *.deb
rm *.deb

#External Tar Packages
wget https://go.dev/dl/go1.20.linux-amd64.tar.gz -O go.tar.gz #Golang
sudo tar -C /usr/local -xzf go.tar.gz
rm *.tar.gz

#External AppImages
wget https://github.com/laurent22/joplin/releases/download/v2.9.17/Joplin-2.9.17.AppImage -O Joplin.AppImage
wget https://objects.githubusercontent.com/github-production-release-asset-2e65be/53538899/10d99e1a-2a5f-4f22-8e6a-5a36932f4978?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20230216%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20230216T025004Z&X-Amz-Expires=300&X-Amz-Signature=70d779396e8bdd53652f234ec231224ef01d181cef7994acd7df85f5fc640a58&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=53538899&response-content-disposition=attachment%3B%20filename%3DBitwarden-2023.2.0-x86_64.AppImage&response-content-type=application%2Foctet-stream -O Bitwarden.AppImage
wget https://objects.githubusercontent.com/github-production-release-asset-2e65be/54836000/48e075d0-64fc-445f-8286-89692e400095?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20230216%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20230216T025117Z&X-Amz-Expires=300&X-Amz-Signature=a4db7cf3730890c3fd34d2f45ecce9de8d947c1df50e16efb05628515464e9da&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=54836000&response-content-disposition=attachment%3B%20filename%3DGDLauncher-linux-setup.AppImage&response-content-type=application%2Foctet-stream
sudo chmod u+x *.AppImage
sudo mv *.AppImage ~/Desktop/


# Install Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser -y


# Install Signal Desktop
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null

echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

sudo apt update && sudo apt install signal-desktop -y


# Install Spotify
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client -y

# Install VMWare Horizon
wget https://download3.vmware.com/software/CART23FQ4_LIN64_2212.1/VMware-Horizon-Client-2212.1-8.8.1-21219348.x64.bundle -o vmware-horizon.bundle
sudo chmod u+x vmware-horizon.bundle
sudo sh ./vmware-horizon.bundle

sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)


sudo npm install --location=global @angular/cli
