echo "Hi, this is ice1000's personal linux installing script."
echo "Issue tracker: https://github.com/ice1000/xjb-config/issues"

## removing garbage
sudo apt remove libreoffice-common libreoffice-core libreoffice-core-base xterm
sudo apt autoremove

## installing chrome, sougou input (not working), wps
cd Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
# wget http://cdn2.ime.sogou.com/dl/index/1509619794/sogoupinyin_2.2.0.0102_amd64.deb
# sudo dpkg -i sogoupinyin_2.2.0.0102_amd64.deb
wget http://kdl.cc.ksosoft.com/wps-community/download/a21/wps-office_10.1.0.5672~a21_amd64.deb
sudo dpkg -i wps-office_10.1.0.5672~a21_amd64.deb
sudo apt -f install
cd ..

## installing rust, cargo
curl -sSf https://static.rust-lang.org/rustup.sh | sh

## installing peek, konsole, emacs, haskell, java, clang, llvm, texlive, themes, 7z
wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu xenial-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'
sudo add-apt-repository ppa:ubuntu-elisp/ppa
sudo add-apt-repository ppa:peek-developers/stable
sudo add-apt-repository ppa:hvr/ghc
sudo add-apt-repository ppa:noobslab/themes
sudo add-apt-repository ppa:noobslab/icons
sudo apt update
sudo apt upgrade
sudo apt install konsole emacs25 cabal-install-2.2 ghc-8.2.1 \
 openjdk-8-jdk openjdk-8-source openjfx openjfx-source peek zlib1g-dev \
 libncurses5-dev clang-4.0 llvm-4.0 texlive p7zip-full ubuntu-tweak \
 flatabulous-theme ultra-flat-icons ultra-flat-icons-orange

## installing sarasa-gothic, fira-code
cd Documents
wget https://github.com/be5invis/Sarasa-Gothic/releases/download/v0.5.1/sarasa-gothic-ttf-0.5.1.7z
7z x sarasa-gothic-ttf-0.5.1.7z
rm sarasa-gothic-ttf-0.5.1.7z
sudo mv sarasa-* /usr/local/share/fonts/
mkdir -p ~/.local/share/fonts
for type in Bold Light Medium Regular Retina; do
    wget -O ~/.local/share/fonts/FiraCode-${type}.ttf \
    "https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-${type}.ttf?raw=true";
done
fc-cache -f -v
cd ..

## installing agda
cabal update
cabal install alex happy cpphs
cabal install --allow-newer Agda
agda-mode setup
agda-mode compile
mkdir ~/SDK
git clone https://github.com/agda/agda-stdlib.git ~/SDK/agda-stdlib/
rm ~/SDK/agda-stdlib/src/index.agda
mkdir ~/.agda
echo "~/SDK/agda-stdlib/standard-library.agda-lib" >> ~/.agda/libraries
echo "standard-library" >> ~/.agda/defaults

## installing kotlin, gradle
curl -s "https://get.sdkman.io" | bash
source ~/.sdkman/bin/sdkman-init.sh
sdk install kotlin
sdk install gradle
