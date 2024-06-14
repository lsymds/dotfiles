wget https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.5.0/gcm-linux_amd64.2.5.0.deb

sudo apt install -y ./gcm-linux_amd64.2.5.0.deb

rm ./gcm-linux_amd64.2.5.0.deb

git-credential-manager configure
git config --global credential.credentialStore secretservice
