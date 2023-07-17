#/bin/bash

warn() { echo -e "\e[33m### $1 ###\e[0m"; }
info() { echo -e "\e[34m### $1 ###\e[0m"; }

# Remove docker old versions
info "Removing docker old versions"
sudo service docker stop 
sudo apt-mark unhold docker-ce docker-ce-cli containerd.io 
sudo apt-get -y purge docker-ce docker-ce-cli containerd.io 
sudo apt-get -y autoremove
sudo apt-get autoclean
sudo rm /usr/local/bin/docker-compose

# Install dependencies
info "Installing dependencies"
sudo apt update
sudo apt -y install apt-transport-https ca-certificates curl gnupg lsb-release

# Add docker repository
info "Adding docker repository"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install docker
info "Installing docker"
sudo apt update
sudo apt -y install docker-ce docker-ce-cli containerd.io 

# Add docker user and setup permissions
info "Adding docker user"
sudo groupadd docker 
sudo usermod -aG docker $USER 

# Download docker compose
info "Installing docker-compose"
latest_tag=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | sed -Ene '/^ *"tag_name": *"(v.+)",$/s//\1/p')
sudo curl -L https://github.com/docker/compose/releases/download/$latest_tag/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# As of 20.10 Ubuntu uses nftables by default, which is not supported by the current Kernel version for WSL2
# This will switch back to iptables, legacy version
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy

warn "OS has been set to use iptables-legacy instead of nftables. This is a temporary workaround until WSL2 supports nftables, but you should be careful for any undesired side effects."
warn "Terminal restart is required to run docker without sudo"
