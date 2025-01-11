#!/bin/bash
# One-liner to install this: curl -sSL https://raw.githubusercontent.com/arealhorse/sd/refs/heads/main/install.sh | bash

echo "________STEP 1: Disable the read-only filesystem"
sudo steamos-readonly disable

echo "________STEP 2: Packman Key"
sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman-key --populate holo

echo "________STEP 3: Download and verify the BlackArch installer script"
curl -O https://blackarch.org/strap.sh
echo "bbf0a0b838aed0ec05fff2d375dd17591cbdf8aa  strap.sh" | sha1sum -c

echo "________STEP 4: Make the installer script executable"
chmod +x strap.sh

echo "________STEP 5: Run the installer script"
sudo ./strap.sh

echo "________STEP 6: Enable multilib repository"
sudo sed -i '/\[multilib\]/,/Include/s/^#//' /etc/pacman.conf

echo "________STEP 7: Sync"
sudo pacman -Syu

echo "________STEP 8: Custom packages"
sudo pacman -S --noconfirm aircrack-ng
