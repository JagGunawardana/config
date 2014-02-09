mkdir -p ~/.vim/colors && cd ~/.vim/colors
wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
wget -O distinguished.vim http://www.vim.org/scripts/script.php?script_id=3529
wget -O github.vim http://www.vim.org/scripts/download_script.php?src_id=12456 
wget -O jellybeans.vim http://www.vim.org/scripts/script.php?script_id=2555 
wget -O vividchalk.vim http://www.vim.org/scripts/download_script.php?src_id=12437
wget -O candy.vim http://www.vim.org/scripts/download_script.php?src_id=817 
wget -O pychimp.vim http://www.vim.org/scripts/download_script.php?src_id=17973
wget -O blackboard.vim http://ianbits.googlecode.com/svn/trunk/vim/blackboard.vim

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim

cd ~/.vim/bundle
git clone git://github.com/tpope/vim-fugitive.git

cd ~/.vim/bundle
wget -O conqueterm.vmb http://www.vim.org/scripts/download_script.php?src_id=16279

cd ~/.vim/bundle
git clone https://github.com/nvie/vim-flake8

cd ~/.vim/bundle
git clone git://github.com/Lokaltog/vim-powerline.git

cd ~/.vim/bundle
git clone https://github.com/kien/ctrlp.vim.git

cd ~/.vim/bundle
git clone git://github.com/davidhalter/jedi-vim.git


mkdir -p ~/.vim/ftplugin
wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
