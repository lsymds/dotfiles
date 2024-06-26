# Needed for all installers
sudo apt update -y
sudo apt install -y curl git unzip

# Ensure computer doesn't go to sleep while installing
gsettings set org.gnome.desktop.session idle-delay 0

# Run installers
for script in ./install/*.sh; do source $script; done

# Revert to normal idle settings
gsettings set org.gnome.desktop.session idle-delay 300

# Upgrade everything that might ask for a reboot last
sudo apt upgrade -y
