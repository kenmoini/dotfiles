# kenmoini/dotfiles

function runSync() {
  # Create needed directories
  echo ""
  echo "Creating needed directories..."
  mkdir -p \
    $HOME/bin \
    $HOME/.config \
    $HOME/.ssh \
    $HOME/.dotfile-backups

  #######################################################
  # Link needed files
  #######################################################

  # SSH Config
  echo ""
  echo "Setting up SSH Config..."
  if [ -L "$HOME/.ssh/config" ]; then
    echo " - Deleting symlink $HOME/.ssh/config"
    rm $HOME/.ssh/config;
  fi
  if [ -f "$HOME/.ssh/config" ]; then
    echo " - Moving file $HOME/.ssh/config to $HOME/.dotfile-backups/.ssh/config"
    mv $HOME/.ssh/config $HOME/.dotfile-backups/ssh-config.$(date +%s);
  fi
  echo " - Creating symlink $HOME/.ssh/config"
  ln -sv $(pwd)/config/ssh/config $HOME/.ssh/config

  # Git Config
  echo ""
  echo "Setting up Git Config..."
  if [ -L "$HOME/.gitconfig" ]; then
    echo " - Deleting symlink $HOME/.gitconfig"
    rm $HOME/.gitconfig;
  fi
  if [ -f "$HOME/.gitconfig" ]; then
    echo " - Moving file $HOME/.gitconfig to $HOME/.dotfile-backups/.gitconfig"
    mv $HOME/.gitconfig $HOME/.dotfile-backups/.gitconfig.$(date +%s);
  fi
  echo " - Creating symlink $HOME/.gitconfig"
  ln -vs $(pwd)/config/git/config $HOME/.gitconfig

  # Git Ignore
  echo ""
  echo "Setting up Git Ignore..."
  if [ -L "$HOME/.gitignore" ]; then
    echo " - Deleting symlink $HOME/.gitignore"
    rm $HOME/.gitignore;
  fi
  if [ -f "$HOME/.gitignore" ]; then
    echo " - Moving file $HOME/.gitignore to $HOME/.dotfile-backups/.gitignore"
    mv $HOME/.gitignore $HOME/.dotfile-backups/.gitignore.$(date +%s);
  fi
  echo " - Creating symlink $HOME/.gitignore"
  ln -vs $(pwd)/config/git/config $HOME/.gitignore

  #######################################################
  # Init Hooks
  #######################################################

  echo ""
  echo "ZSH_VERSION: $ZSH_VERSION";
  echo "BASH_VERSION: $BASH_VERSION";
  echo "SHELL: $SHELL";

  if [ $(echo $SHELL | grep bash | wc -l) -eq 1 ]; then
    echo "Detected a Bash shell..."
    if [ -f "$HOME/.bashrc" ]; then
      BOOTSTRAP_FILE="$HOME/.bashrc";
    else
      if [ -f "$HOME/.bash_profile" ]; then
        BOOTSTRAP_FILE="$HOME/.bash_profile";
      fi
    fi
  fi
  
  if [ $(echo $SHELL | grep zsh | wc -l) -eq 1 ]; then
    echo "Detected a ZSH shell..."
    if [ -f "$HOME/.zshrc" ]; then
      BOOTSTRAP_FILE="$HOME/.zshrc";
    else
      if [ -f "$HOME/.zprofile" ]; then
        BOOTSTRAP_FILE="$HOME/.zprofile";
      fi
    fi
  fi

  if [ -z "$BOOTSTRAP_FILE" ]; then
    echo "Unable to find a shell file to add the bootstrap to.";
    exit 1;
  else
    echo ""
    echo "Adding bootstrap to $BOOTSTRAP_FILE ...";
  fi

  # Check to see if the line is already in the file
  if ! grep -q "source $HOME/.dotfiles/shell/exports" "$BOOTSTRAP_FILE"; then
    echo " - Adding exports..."
    echo "source $HOME/.dotfiles/shell/exports" >> "$BOOTSTRAP_FILE";
  fi

  if ! grep -q "source $HOME/.dotfiles/shell/aliases" "$BOOTSTRAP_FILE"; then
    echo " - Adding aliases..."
    echo "source $HOME/.dotfiles/shell/aliases" >> "$BOOTSTRAP_FILE";
  fi

  if ! grep -q "source $HOME/.dotfiles/shell/profile" "$BOOTSTRAP_FILE"; then
    echo " - Adding profile..."
    echo "source $HOME/.dotfiles/shell/profile" >> "$BOOTSTRAP_FILE";
  fi

  if ! grep -q "source $HOME/.dotfiles/shell/functions" "$BOOTSTRAP_FILE"; then
    echo " - Adding functions..."
    echo "source $HOME/.dotfiles/shell/functions" >> "$BOOTSTRAP_FILE";
  fi

}