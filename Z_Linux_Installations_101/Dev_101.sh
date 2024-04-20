#!/bin/bash

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

# Explain the risks to the user
echo "Installing Snap/Flatpak applications can introduce new software dependencies and potential security risks."
echo "Do you understand it and want to proceed with the installation?"

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo apt install snapd

echo "Flatpak and snapcraft packages ready to be installed"

# Prompt the user if they want to proceed
if prompt_yes_no; then
    # User agreed, proceed with installations
    #flatpak install flathub com.vscodium.codium
    sudo snap install codium --classic

    flatpak install flathub org.spyder_ide.spyder

    flatpak install flathub io.gitlab.librewolf-community
    flatpak install flathub com.brave.Browser

    echo "Installing HUGO/NPM"
    snap install hugo
    snap install node --channel=21/stable --classic

    # Display installed Snap and Flatpak packages
    echo "Installed Snap packages:"
    snap list
    echo "Installed Flatpak packages:"
    flatpak list
else
    # User declined, exit
    echo "Installation aborted."
fi




