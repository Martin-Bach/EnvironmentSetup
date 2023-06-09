# Setup Mac
# Install Homebrew
which -s brew
if [[ $? != 0 ]] ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" | echo "HOMEBREW installed!"
else
    brew update | echo "HOMEBREW updated!"
fi

# Method for installing or upgrade brew packages.
InstallOrUpdate() {
    installed=$(brew ls --versions $1)
    if [[ -z "$installed"  ]] ; then
        brew install $2 $1 | echo "Installed $1"
    else
        brew upgrade $1 | echo "Tried upgrading $1"
    fi
}

# Packages to install
InstallOrUpdate jetbrains-toolbox --cask 
InstallOrUpdate visual-studio-code --cask 
InstallOrUpdate iterm2 --cask 
InstallOrUpdate zsh
InstallOrUpdate zsh-syntax-highlighting
InstallOrUpdate zsh-autosuggestions
InstallOrUpdate terraform
InstallOrUpdate azure-cli
InstallOrUpdate jandedobbeleer/oh-my-posh/oh-my-posh
InstallOrUpdate fork --cask
InstallOrUpdate commander-one --cask
InstallOrUpdate rectangle --cask
InstallOrUpdate git
InstallOrUpdate fig --cask
InstallOrUpdate alt-tab --cask
InstallOrUpdate exa

brew tap azure/functions
InstallOrUpdate azure-functions-core-tools@4
# if upgrading on a machine that has 2.x or 3.x installed:
brew link --overwrite azure-functions-core-tools@4

# Install Fonts
## TODO copy the fonts
# Go into each font fold in repo and install. 
cp Fonts/CascadiaCode/* /Library/Fonts
cp Fonts/CascadiaCode/* ~/Library/Fonts

cp Fonts/CascadiaCodeNF/* /Library/Fonts
cp Font/CascadiaCodeNF/* ~/Library/Fonts

cp OhMyPosh/custom-theme-oh-my-posh.json $HOME
cp Zsh/.zshrc $HOME

echo "Set fonts in terminal to NF font. Set IDE fonts aswell."
