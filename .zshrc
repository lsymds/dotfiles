# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Alias loading
for file in ~/.config/aliases/*.bash_aliases; do
    source "$file"
done

# Git Credential Manager
export GCM_CREDENTIAL_STORE=secretservice

# Path
export PATH=$PATH:/usr/local/go/bin:~/go/bin:~/.n/bin:~/.local/bin
