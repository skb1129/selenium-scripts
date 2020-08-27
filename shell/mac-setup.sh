#!/bin/zsh

export $(cat .env | xargs)

ZSH_ENV=~/.zshenv

# Create ZSH configuration file
touch $ZSH_ENV

# Install Homebrew CLI
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install tools with brew
brew install nvm
brew install pipenv
brew install maven
brew install fastlane
brew install wget
brew install mas

# Setup NVM
echo 'export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"' >> $ZSH_ENV

# Install latest stable node version
nvm install --lts

# Install global npm packages
npm install -g yarn

# Move to downloads
cd ~/Downloads

# Download and install Google Chrome
wget https://dl.google.com/chrome/mac/stable/CHFA/googlechrome.dmg
DRIVE=$(hdiutil attach googlechrome.dmg -mountrandom /Volumes/ | tail -1 | awk {'print $NF'})
cp -r $DRIVE/Google\ Chrome.app /Applications/
hdiutil detach $DRIVE

# Download and install VSCode
wget https://az764295.vo.msecnd.net/stable/91899dcef7b8110878ea59626991a18c8a6a1b3e/VSCode-darwin-stable.zip
unzip VSCode-darwin-stable.zip
cp -r Visual\ Studio\ Code.app /Applications/

# Download and install Idea Ultimate
wget https://download-cf.jetbrains.com/idea/ideaIU-${INTELLIJ_VERSION}.dmg
DRIVE=$(hdiutil attach ideaIU-${INTELLIJ_VERSION}.dmg -mountrandom /Volumes/ | tail -1 | awk {'print $NF'})
cp -r $DRIVE/IntelliJ\ IDEA.app /Applications/
hdiutil detach $DRIVE

# Download and install WebStorm
wget https://download-cf.jetbrains.com/webstorm/WebStorm-${INTELLIJ_VERSION}.dmg
DRIVE=$(hdiutil attach WebStorm-${INTELLIJ_VERSION}.dmg -mountrandom /Volumes/ | tail -1 | awk {'print $NF'})
cp -r $DRIVE/WebStorm.app /Applications/
hdiutil detach $DRIVE

# Download and install PyCharm
wget https://download-cf.jetbrains.com/python/pycharm-professional-${INTELLIJ_VERSION}.dmg
DRIVE=$(hdiutil attach pycharm-professional-${INTELLIJ_VERSION}.dmg -mountrandom /Volumes/ | tail -1 | awk {'print $NF'})
cp -r $DRIVE/PyCharm.app /Applications/
hdiutil detach $DRIVE

# Download and install IINA
wget https://dl.iina.io/IINA.v${IINA_VERSION}.dmg
DRIVE=$(hdiutil attach IINA.v${IINA_VERSION}.dmg -mountrandom /Volumes/ | tail -1 | awk {'print $NF'})
cp -r $DRIVE/IINA.app /Applications/
hdiutil detach $DRIVE

# Download and install AppCleaner
wget https://freemacsoft.net/downloads/AppCleaner_${APP_CLEANER_VERSION}.zip
unzip AppCleaner_${APP_CLEANER_VERSION}.zip
cp -r AppCleaner.app /Applications/

# Download and install Postman
wget -O Postman.zip https://dl.pstmn.io/download/latest/osx
unzip Postman.zip
cp -r Postman.app /Applications/

# Download and install Docker
wget https://download.docker.com/mac/stable/Docker.dmg
DRIVE=$(hdiutil attach Docker.dmg -mountrandom /Volumes/ | tail -1 | awk {'print $NF'})
cp -r $DRIVE/Docker.app /Applications/
hdiutil detach $DRIVE

cd

# AppStore install Xcode, Slack, WhatsApp, Keynote, Apple Developer
mas install 497799835
mas install 803453959
mas install 1147396723
mas install 409183694
mas install 640199958
