#!/bin/bash

# Start script execution
echo "Starting the setup process..."

# Step 1: Check if Nix is installed, if not install it
echo "Checking if Nix is installed..."
if ! command -v nix &> /dev/null
then
    echo "Nix is not installed. Installing Nix..."
    curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
    echo "Nix installation complete."
else
    echo "Nix is already installed."
fi

# Step 2: Clone the dotfiles repository into the home folder
echo "Cloning the dotfiles repository into the home folder..."
cd ~
git clone git@github.com:gaganref/dotfiles.git
echo "Repository cloned successfully."

# Step 3: Run `stow .` to symlink the dotfiles
echo "Running 'stow .' to create symlinks for dotfiles..."
cd ~/dotfiles
stow .
echo "'stow .' completed successfully."

# Step 4: Echo message in green to remind the user to restart the terminal
echo -e "\033[0;32mSetup complete! Please close and reopen your terminal to apply the config.\033[0m"
