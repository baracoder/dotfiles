all: vim configs

configs:
	./relink

vim: vim-pathogen vim-ctrlp vim-Align vim-tagbar vim-syntastic vim-gpg

vim-pathogen: ~/.vim/autoload/pathogen.vim
~/.vim/autoload/pathogen.vim:
	mkdir -p ~/.vim/autoload ~/.vim/bundle
	curl -Sso ~/.vim/autoload/pathogen.vim \
	    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim


vim-ctrlp: vim-pathogen ~/.vim/bundle/ctrlp.vim
~/.vim/bundle/ctrlp.vim:
	git clone https://github.com/kien/ctrlp.vim.git $@
	cd $@ && vim -c "helptags doc/" -c q

vim-Align: ~/.vim/bundle/Align
~/.vim/bundle/Align:
	git clone https://github.com/vim-scripts/Align.git $@
	cd $@ && vim -c "helptags doc/" -c q

vim-tagbar: ~/.vim/bundle/tagbar
~/.vim/bundle/tagbar:
	git clone https://github.com/majutsushi/tagbar.git $@
	cd $@ && vim -c "helptags doc/" -c q

vim-syntastic: ~/.vim/bundle/syntastic
~/.vim/bundle/syntastic:
	git clone https://github.com/scrooloose/syntastic.git $@
	cd $@ && vim -c "helptags doc/" -c q

vim-gpg: ~/.vim/bundle/vim-gnupg
~/.vim/bundle/vim-gnupg:
	git clone https://github.com/jamessan/vim-gnupg.git $@
	cd $@ && vim -c "helptags doc/" -c q

