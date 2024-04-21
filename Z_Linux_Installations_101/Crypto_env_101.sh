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
echo "Installing Flatpak applications can introduce new software dependencies and potential security risks."
echo "Do you want to proceed with the installation?"

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


# Prompt the user if they want to proceed
if prompt_yes_no; then
    # User agreed, proceed with installations
    flatpak install flathub info.portfolio_performance.PortfolioPerformance
    flatpak install flathub org.electrum.electrum #BTC
    flatpak install flathub org.featherwallet.Feather #Monero
    flatpak install flathub com.brave.Browser
else
    # User declined, exit
    echo "Installation aborted."
fi
