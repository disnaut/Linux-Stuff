#!/bin/bash

#Update
sudo apt update && sudo apt upgrade -y

#Install programs
sudo apt install nodejs npm curl python2.7 git -y

#External Debian Packages
wget https://dl.discordapp.net/apps/linux/0.0.25/discord-0.0.25.deb -O discord.deb #Discord
wget https://az764295.vo.msecnd.net/stable/441438abd1ac652551dbe4d408dfcec8a499b8bf/code_1.75.1-1675893397_amd64.deb -O vs_code.deb #Visual Studio
wget https://downloads.mongodb.com/compass/mongodb-mongosh_1.7.1_amd64.deb -O mongodb-compass.deb #MongoDb Compass


sudo dpkg -i *.deb
rm *.deb

#External Tar Packages
wget https://go.dev/dl/go1.20.linux-amd64.tar.gz -O go.tar.gz #Golang
tar -C /usr/local -xzf go1.20.linux-amd64.tar.gz
rm *.tar.gz

#External Bundle Packages
wget https://download3.vmware.com/software/CART23FQ4_LIN64_2212.1/VMware-Horizon-Client-2212.1-8.8.1-21219348.x64.bundle -O vmware-horizon.bundle #VMWare Horizon
sudo chmod
sudo ./vmware-horizion.bundle
rm *.bundle



#External AppImages
wget https://www.fosshub.com/qBittorrent.html?dwl=qbittorrent-4.5.1_x86_64.AppImage -O qBittorent.AppImage
wget https://github.com/laurent22/joplin/releases/download/v2.9.17/Joplin-2.9.17.AppImage -O Joplin.AppImage



# Install Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser -y

#Install Jackett as a service
cd /opt && f=Jackett.Binaries.LinuxAMDx64.tar.gz && release=$(wget -q https://github.com/Jackett/Jackett/releases/latest -O - | grep "title>Release" | cut -d " " -f 4) && sudo wget -Nc https://github.com/Jackett/Jackett/releases/download/$release/"$f" && sudo tar -xzf "$f" && sudo rm -f "$f" && cd Jackett* && sudo ./install_service_systemd.sh && systemctl status jackett.service && cd - && echo -e "\nVisit http://127.0.0.1:9117"

#Install Signal
# 1. Install our official public software signing key
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null

# 2. Add our repository to your list of repositories
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

# 3. Update your package database and install signal
sudo apt update && sudo apt install signal-desktop -y

#Install Joplin
NPM_CONFIG_PREFIX=~/.joplin-bin npm install -g joplin
sudo ln -s ~/.joplin-bin/bin/joplin /usr/bin/joplin

# Install Spotify
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client -y







