# kenmoini/dotfiles

cd "$(dirname "${BASH_SOURCE}")";

# Assuming this file is in the scripts directory...
cd ..

echo "Updating dotfiles from Git...\n";
#git pull origin main;

source scripts/sync.sh;

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  runSync;
else
  echo "============== !!! WARNING !!! =============="
  echo "This may overwrite existing files in your home directory."
  read -p "Are you sure? (y/N) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    runSync;
  fi;
fi;

unset runSync;
