sudo apt-get install -y git
sudo apt-get install -y python-pip
sudo apt-get install -y mysql-server
sudo apt-get install -y mysql-client
sudo apt-get install -y libmysqlclient-dev
sudo apt-get install -y postgresql
sudo apt-get install -y postgresql-contrib
sudo apt-get install -y mysql-client
sudo apt-get install -y python-dev
sudo apt-get install -y tmux
sudo apt-get install -y vim-athena
sudo apt-get install -y g++
sudo apt-get install -y exuberant-ctags
sudo apt-get install -y tig
sudo apt-get install -y irssi
sudo apt-get install -y postgresql-9.3
sudo pip install virtualenv
sudo pip install virtualenvwrapper
sudo pip install pytest
sudo pip install ipython
sudo pip install ipdb
sudo pip install coverage
sudo pip install flake8
sudo pip install zc.buildout
sudo pip install --upgrade httpie
echo trustybox > /etc/hostname

mkdir -p /home/vagrant/bin


rm /home/vagrant/.vimrc
rm /home/vagrant/.tmux.conf
rm /home/vagrant/.bashrc
rm /home/vagrant/bin/file_watch.sh
rm /home/vagrant/.pdbrc.py
rm /home/vagrant/.Renviron
rm /home/vagrant/.Rprofile

pushd /home/vagrant/config
ln -s `pwd`/.vimrc ~/.vimrc
ln -s `pwd`/.tmux.conf ~/.tmux.conf
ln -s `pwd`/.bashrc  ~/.bashrc
ln -s `pwd`/bin/db.sh ~/bin/db.sh
ln -s `pwd`/bin/file_watch.sh ~/bin/file_watch.sh
ln -s `pwd`/.pdbrc.py ~/.pdbrc.py
ln -s `pwd`/.Renviron ~/.Renviron
ln -s `pwd`/.Rprofile ~/.Rprofile
ln -s /home/vagrant/mac/bin/db.sh ~/bin/db.sh
mkdir ~/.config
ln -s ~/config/.flake8 ./.config/flake8
popd

mkdir -p /home/vagrant/.vim
mkdir -p /home/vagrant/.vim/bundle
git clone https://github.com/gmarik/vundle.git /home/vagrant/.vim/bundle/vundle
vim +PluginInstall +qall
pip install git+git://github.com/mverteuil/pytest-ipdb.git
git config --global user.name "Jag Gunawardana"
git config --global user.email "jag.gunawardana@saffrondigital.com"
git config --global push.default simple
