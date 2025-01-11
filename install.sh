#!/bin/bash
# One-liner to install this: curl -sSL https://raw.githubusercontent.com/arealhorse/sd/refs/heads/main/install.sh | bash

# Disable the read-only filesystem
sudo steamos-readonly disable

sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman-key --populate holo

# Download and verify the BlackArch installer script
curl -O https://blackarch.org/strap.sh
echo "bbf0a0b838aed0ec05fff2d375dd17591cbdf8aa  strap.sh" | sha1sum -c

# Make the installer script executable
chmod +x strap.sh

# Run the installer script
sudo ./strap.sh

# Enable multilib repository
sudo sed -i '/\[multilib\]/,/Include/s/^#//' /etc/pacman.conf

# Synchronize and update package databases
sudo pacman -Syu
