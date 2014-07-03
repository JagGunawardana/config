sudo apt-get install git python-pip
sudo apt-get install mysql-server
sudo apt-get install mysql-client
sudo apt-get install libmysqlclient-dev
sudo apt-get install mysql-client
sudo apt-get install python-dev
sudo pip install virtualenv==1.10.1
sudo pip install virtualenvwrapper

mkdir -p ~/bin

ln -s `pwd`/.vimrc ~/.vimrc
ln -s `pwd`/.tmux.conf ~/.tmux.conf
ln -s `pwd`/.bashrc  ~/.bashrc 
ln -s `pwd`/bin/db.sh ~/bin/db.sh
ln -s `pwd`/bin/file_watch.sh ~/bin/file_watch.sh
ln -s `pwd`/.pdbrc.py ~/.pdbrc.py


mkdir ~/.vim
mkdir ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +PluginInstall +qall
