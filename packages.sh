sudo apt-get install -y git
sudo apt-get install -y python-pip
sudo apt-get install -y mysql-server
sudo apt-get install -y mysql-client
sudo apt-get install -y libmysqlclient-dev
sudo apt-get install -y postgresql
sudo apt-get install -y postgresql-contrib
sudo apt-get install -y mysql-client
sudo apt-get install -y python-dev
sudo pip install virtualenv
sudo pip install virtualenvwrapper
sudo pip install pytest
sudo pip install ipython
sudo pip install ipdb

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
popd

mkdir /home/vagrant/.vim
mkdir /home/vagrant/.vim/bundle
git clone https://github.com/gmarik/vundle.git /home/vagrant/.vim/bundle/vundle
vim +PluginInstall +qall
pip install git+git://github.com/mverteuil/pytest-ipdb.git
