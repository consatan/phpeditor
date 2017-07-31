#!/bin/bash

# apt update
apt-get update -y -q
apt-get upgrade -y -q

# install base command
apt-get install -y --no-install-recommends vim vim-nox tree less screen git rsync xmlstarlet locales python \
    net-tools openssh-server aptitude sudo curl wget ftp php-cli php-dom php-zip php-mbstring php-curl \
    default-mysql-client ctags cscope zsh dialog apt-utils silversearcher-ag

# set default locale
mv -f /tmp/src/locale /etc/default/locale

# locale-gen
sed -i 's/# en_GB/en_GB/' /etc/locale.gen
sed -i 's/# en_US/en_US/' /etc/locale.gen
sed -i 's/# zh_CN/zh_CN/' /etc/locale.gen

locale-gen

# timezone
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
mv -f /tmp/src/timezone /etc/timezone
mv -f /tmp/src/.bashrc /root/.bashrc

# ssh key
mkdir -p /root/.ssh
mkdir /var/run/sshd
chmod 600 /root/.ssh
touch /root/.ssh/config
mv /tmp/src/authorized_keys /root/.ssh/authorized_keys
chmod 700 /root/.ssh/authorized_keys
# ssh config file
mv -f /tmp/src/ssh/* /etc/ssh
chmod 600 /etc/ssh/ssh_host_*_key

# screen config
mv -f /tmp/src/.screenrc /root/.screenrc

# composer
mkdir  /root/.composer
mv /tmp/src/composer /usr/local/bin/composer
chmod +x /usr/local/bin/composer
/usr/local/bin/composer self-update

/usr/local/bin/composer global require consatan/phpctags

# vim config
mkdir -p /root/.vim
git clone https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim
mv -f /tmp/src/.vimrc /root/.vimrc
mv -f /tmp/src/.vim/colors /root/.vim/
# install vim plugin
vim +PluginInstall +qall

# copy to skel
mkdir -p /etc/skel/.ssh
mkdir -p /etc/skel/.vim
touch /etc/skel/.ssh/config
cp /root/.vimrc /etc/skel/.vimrc
cp /root/.screenrc /etc/skel/.screenrc
cp /root/.bashrc /etc/skel/.bashrc
mv -f /tmp/src/.profile /etc/skel/.profile

# oh my zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
mkdir -p /root/.oh-my-zsh/custom/{themes,plugins}
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /root/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions
wget -q -O /root/.oh-my-zsh/custom/themes/lambda-mod.zsh-theme https://github.com/halfo/lambda-mod-zsh-theme/raw/master/lambda-mod.zsh-theme
mv -f /tmp/src/.zshrc /root/.zshrc

# set default shell to zsh
chsh -s /bin/zsh

mkdir /workspace

# clean apt cache
apt-get autoremove -y -q
apt-get clean -y -q
rm -rf /var/lib/apt/lists/*
