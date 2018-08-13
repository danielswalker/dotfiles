/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew analytics off
brew cask install spotify
brew cask install google-chrome
brew cask install iterm2
brew install git
mkdir repos
cd repos
ssh-keygen -t rsa -C "dnwlker@gmail.com"
cat ~/.ssh/id_rsa.pub | pbcopy
git clone git@github.com:danielswalker/dotfiles.git

brew cask install \
    qlcolorcode \
    qlstephen \
    qlmarkdown \
    quicklook-json \
    qlprettypatch \
    quicklook-csv \
    betterzipql \
    webpquicklook \
    suspicious-package

brew install tree
brew install ack
brew install ctags

ln -s repos/dotfiles/_bash_profile_osx_10_13 ~/.bash_profile

git config --global user.name "Daniel Walker"
git config --global user.email "dnwlker@gmail.com"
ln -s repos/dotfiles/vim/_vimrc .vimrc
ln -s repos/dotfiles/vim/_vim .vim

make "light" and "dark" profiles in iterm2 - set to solarized light and dark
make bglight and bgdark bash functions in .bash_profile - set COLORFGBG
let vim user COLORFGBG to choose vim colorscheme
add ctrl-<hjkl> for switching active panes to iterm2 bindings

brew cask install homebrew/cask-drivers/synology-drive

brew cask install caffeine
brew install bash-completion
brew install the_silver_searcher

# bash completion, key bindings, fuzzy auto complete
/usr/local/opt/fzf/install y y y

# for gtac (tac)
brew install coreutils

iterm2 install shell integration and utilities
iterm2 Profiles > Terminal > Show mark indicators, deselect

brew install findutils
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
#curl https://raw.githubusercontent.com/riobard/bash-powerline/master/bash-powerline.sh > ~/.bash-powerline.sh

brew install exiftool

brew install wget
wget https://repo.continuum.io/miniconda/Miniconda2-latest-MacOSX-x86_64.sh
bash Miniconda2-latest-MacOSX-x86_64.sh
rm Miniconda2-latest-MacOSX-x86_64.sh
source ~/.bash_profile
conda install anaconda


# elodie
git clone it
mkdir ~/.elodie
cp config.ini-sample ~/.elodie/config.ini
conda install future
conda install tabulate

brew cask install google-backup-and-sync