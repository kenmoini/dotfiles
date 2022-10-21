# kenmoini/dotfiles

cd "$(dirname "${BASH_SOURCE}")";

# Assuming this file is in the scripts directory...
cd ..

# Ask for the administrator password upfront
sudo -v

# Perform a system update
sudo dnf update -y

# Install the following packages
sudo dnf install -y \
  cockpit \
  cockpit-machines \
  cockpit-podman \
  wget \
  curl \
  git \
  nano \
  firewalld \
  zsh

# Start the Cockpit service
sudo systemctl enable --now cockpit.socket

# Start the Firewall service
sudo systemctl enable --now firewalld

# Copy the Root CAs to the system store
sudo cp root-certs/*.pem /etc/pki/ca-trust/source/anchors/
sudo update-ca-trust