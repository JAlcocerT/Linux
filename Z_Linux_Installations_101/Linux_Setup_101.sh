#!/bin/sh

# Check for root privileges
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi


echo "Adding automatic updates..."
sudo apt install unattended-upgrades -y
sudo dpkg-reconfigure -plow unattended-upgrades



# Function to install Docker and Docker Compose
install_docker() {
    echo "Updating system and installing required packages..."
    apt-get update && apt-get upgrade -y
    echo "Downloading Docker installation script..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    echo "Docker installed successfully. Checking Docker version..."
    docker version

    echo "Testing Docker installation with 'hello-world' image..."
    docker run hello-world
    echo "Installing Docker Compose..."
    sudo apt install docker-compose-plugin #use with docker compose up -d
    apt install docker-compose -y #use with docker-compose up -d
    #sudo apt remove docker-compose

    echo "Docker Compose installed successfully. Checking version..."
    docker-compose --version
    echo "Checking status of Docker service..."
    #systemctl status docker
    systemctl status docker | grep "Active"
    docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce

}

install_podman() {
    echo "Installing Podman OCI..."
    apt install podman
    podman --version
}

# Function to prompt the user with a yes/no question
prompt_yes_no() {
    while true; do
        read -p "$1 [y/n]: " yn
        case $yn in
            [Yy]* ) return 0;;  # User answered Yes, return 0
            [Nn]* ) return 1;;  # User answered No, return 1
            * ) echo "Please answer yes or no.";;
        esac
    done
}


# Ask user if they want to install Docker - https://jalcocert.github.io/RPi/posts/selfhosting-with-docker/#install-docker
echo "Do you want to install DOCKER Containers on your system? (yes/no)"
read install_docker_answer
case $install_docker_answer in
    [yY] | [yY][eE][sS])
        install_docker #Docker Containers
        ;;
    [nN] | [nN][oO])
        echo "Docker installation skipped."
        ;;
    *)
        echo "Invalid response. Exiting."
        exit 1
        ;;
esac



# Ask user if they want to install Docker - https://jalcocert.github.io/RPi/posts/selfhosting-with-docker/#install-docker
echo "Do you want to install PODMAN Containers on your system? (yes/no)"
read install_docker_answer
case $install_docker_answer in
    [yY] | [yY][eE][sS])
        install_podman #Podman Containers
        ;;
    [nN] | [nN][oO])
        echo "PODMAN installation skipped."
        ;;
    *)
        echo "Invalid response. Exiting."
        exit 1
        ;;
esac


echo "Flatpak and snapcraft packages ready to be installed: VSCODIUM, LIBREWOLF, BRAVE"

# Prompt the user if they want to proceed
if prompt_yes_no; then
    # User agreed, proceed with installations
    #flatpak install flathub com.vscodium.codium
    sudo snap install codium --classic
    echo "Installing some vscodium extensions" #https://marketplace.visualstudio.com/VSCode
    codium --install-extension unifiedjs.vscode-mdx
    codium --install-extension astro-build.astro-vscode
    codium --install-extension ms-python.python
    codium --install-extension gitlab.gitlab-workflow
    #code --install-extension gitlab.gitlab-workflow

    #flatpak install flathub org.spyder_ide.spyder

    flatpak install flathub io.gitlab.librewolf-community
    flatpak install flathub com.brave.Browser

    # Display installed Snap and Flatpak packages
    echo "Installed Snap packages:"
    snap list
    echo "Installed Flatpak packages:"
    flatpak list
else
    # User declined, exit
    echo "Installation aborted."
fi



echo "Do you want to play around with video? OBS Studio, GyroFlow, ffmpeg,..."

# Prompt the user if they want to proceed
if prompt_yes_no; then
    # User agreed, proceed with installations
    #flatpak install flathub com.vscodium.codium
    sudo flatpak install flathub com.obsproject.Studio
    echo "Installing some vscodium extensions" #https://marketplace.visualstudio.com/VSCode
    codium --install-extension unifiedjs.vscode-mdx

    #code --install-extension gitlab.gitlab-workflow

    #flatpak install flathub org.spyder_ide.spyder

    flatpak install flathub io.gitlab.librewolf-community
    flatpak install flathub com.brave.Browser
else
    # User declined, exit
    echo "Installation aborted."
fi


echo "Do you want to install Bitwarden?"

# Prompt the user if they want to proceed
if prompt_yes_no; then
    # User agreed, proceed with installations
    #flatpak install flathub com.vscodium.codium
    echo "Installing some vscodium extensions" #https://marketplace.visualstudio.com/VSCode
    sudo snap install bitwarden
else
    # User declined, exit
    echo "Installation aborted."
fi

### TAILSCALE VPN ###

# Function to install Tailscale VPN - https://jalcocert.github.io/Linux/docs/debian/linux_vpn_setup/#tailscale
install_tailscale() {
    echo "Installing Tailscale VPN..."
    curl -fsSL https://tailscale.com/install.sh | sh
    #sudo tailscale up
    echo "Execute tailscale up to finish the setup."

}


# Ask user if they want to install Tailscale VPN
echo "Do you want to install Tailscale VPN on your system? (yes/no)"
read install_tailscale_answer
case $install_tailscale_answer in
    [yY] | [yY][eE][sS])
        install_tailscale
        ;;
    [nN] | [nN][oO])
        echo "Tailscale VPN installation skipped."
        ;;
    *)
        echo "Invalid response. Exiting."
        exit 1
        ;;
esac