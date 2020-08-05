echo "Hi, this is ice1000's personal linux installing script."
echo "Issue tracker: https://github.com/ice1000/xjb-config/issues"

## removing garbage
sudo apt remove libreoffice-common libreoffice-core libreoffice-core-base xterm
sudo apt autoremove

## installing some debs
cd Downloads
## installing chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
## installing sougou input (not working)
# wget http://cdn2.ime.sogou.com/dl/index/1509619794/sogoupinyin_2.2.0.0102_amd64.deb
# sudo dpkg -i sogoupinyin_2.2.0.0102_amd64.deb
## installing wps
wget http://kdl.cc.ksosoft.com/wps-community/download/6757/wps-office_10.1.0.6757_amd64.deb
sudo dpkg -i wps-office_10.1.0.6757_amd64.deb
## installing jd-gui
wget https://github.com/java-decompiler/jd-gui/releases/download/v1.4.0/jd-gui_1.4.0-0_all.deb
sudo dpkg -i jd-gui_1.4.0-0_all.deb
## installing bat
wget https://github.com/sharkdp/bat/releases/download/v0.11.0/bat-musl_0.11.0_amd64.deb
sudo dpkg -i bat-musl_0.11.0_amd64.deb
## installing libjsoncpp0 (required by zig)
# wget http://mirrors.xmission.com/ubuntu/pool/universe/libj/libjsoncpp/libjsoncpp0_0.6.0~rc2-3ubuntu1_amd64.deb
# sudo dpkg -i libjsoncpp0_0.6.0~rc2-3ubuntu1_amd64.deb
## install dependencies
sudo apt -f install
cd ..

## installing rust, cargo
curl -sSf https://static.rust-lang.org/rustup.sh | sh

## installing haskell-stack
# wget -qO- https://get.haskellstack.org/ | sh

## installing peek, konsole, emacs, haskell, java, git, texlive, themes, 7z, ruby
wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu xenial-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'
sudo add-apt-repository ppa:ubuntu-elisp/ppa
sudo add-apt-repository ppa:peek-developers/stable
sudo add-apt-repository ppa:hvr/ghc
sudo add-apt-repository ppa:git-core/ppa
sudo add-apt-repository ppa:noobslab/themes
sudo add-apt-repository ppa:noobslab/icons
sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt update
sudo apt upgrade
sudo apt install konsole emacs25 ghc-8.8.3 cabal-install-3.2 libicu-dev \
 openjdk-11-jdk openjdk-11-source openjfx openjfx-source peek zlib1g-dev \
 libncurses5-dev texlive texlive-xetex p7zip-full tree screenfetch git \
 ruby2.5 ruby2.5-dev gem compizconfig-settings-manager
screenfetch

## installing jekyll, bundler, my blog
sudo gem install bundler
cd Public
git clone https://github.com/ice1000/ice1000.github.io.git
cd ice1000.github.io
bundle config mirror.https://rubygems.org https://gems.ruby-china.org
bundle install # may require sudo
bundler exec jekyll build
cd ..

## installing sarasa-gothic, fira-code
cd Documents
wget https://github.com/be5invis/Sarasa-Gothic/releases/download/v0.8.1/sarasa-gothic-ttf-0.8.1.7z
7z x sarasa-gothic-ttf-0.8.1.7z
rm sarasa-gothic-ttf-0.8.1.7z
sudo mv sarasa-* /usr/local/share/fonts/
mkdir -p ~/.local/share/fonts
for type in Bold Light Medium Regular Retina; do
    wget -O ~/.local/share/fonts/FiraCode-${type}.ttf \
    "https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-${type}.ttf?raw=true";
done
fc-cache -f -v
cd ..

## installing agda
mkdir ~/SDK
cabal update
cabal install alex happy
git clone https://github.com/agda/agda.git ~/SDK/agda/
cd ~/SDK/agda
make install
cd -
agda-mode setup
agda-mode compile
git clone https://github.com/agda/agda-stdlib.git ~/SDK/agda-stdlib/
git clone https://github.com/agda/cubical.git ~/SDK/agda-cubical/
mkdir ~/.agda
echo "~/SDK/agda-stdlib/standard-library.agda-lib" >> ~/.agda/libraries
echo "~/SDK/agda-cubical/cubical.agda-lib" >> ~/.agda/libraries
echo "standard-library" >> ~/.agda/defaults
echo "cubical" >> ~/.agda/defaults

## installing kotlin, gradle
curl -s "https://get.sdkman.io" | bash
source ~/.sdkman/bin/sdkman-init.sh
sdk install kotlin
sdk install gradle
sdk install maven

## installing zig
# TODO: download zig exe
# git clone https://github.com/zig-lang/zig.git
# cd zig
# ci/travis_linux_before_install
# ci/travis_linux_install # evil
# sudo apt-get install -y clang-6.0 libclang-6.0 libclang-6.0-dev llvm-6.0 \
#  llvm-6.0-dev liblld-6.0 liblld-6.0-dev cmake wine1.6-amd64
# ci/travis_linux_script

