sudo apt-get install -y git python-pip
sudo apt-get install -y mysql-server
sudo apt-get install -y mysql-client
sudo apt-get install -y libmysqlclient-dev
sudo apt-get install -y mysql-client
sudo apt-get install -y python-dev
sudo apt-get install -y python-pip
sudo pip install virtualenv
sudo pip install virtualenvwrapper
sudo pip install pytest
sudo pip install ipython
sudo pip install ipdb

mkdir -p ~/bin


rm ~/.vimrc
rm ~/.tmux.conf
rm ~/.bashrc
rm ~/bin/file_watch.sh
rm ~/.pdbrc.py
rm ~/.Renviron
rm ~/.Rprofile

pushd ~/setup/config
ln -s `pwd`/.vimrc ~/.vimrc
ln -s `pwd`/.tmux.conf ~/.tmux.conf
ln -s `pwd`/.bashrc  ~/.bashrc
ln -s `pwd`/bin/db.sh ~/bin/db.sh
ln -s `pwd`/bin/file_watch.sh ~/bin/file_watch.sh
ln -s `pwd`/.pdbrc.py ~/.pdbrc.py
ln -s `pwd`/.Renviron ~/.Renviron
ln -s `pwd`/.Rprofile ~/.Rprofile
popd

mkdir ~/.vim
mkdir ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +PluginInstall +qall
pip install git+git://github.com/mverteuil/pytest-ipdb.git
