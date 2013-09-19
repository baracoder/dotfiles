all: vim configs

configs:
	./relink

vim: vim-pathogen vim-ctrlp vim-Align vim-tagbar

vim-pathogen: ~/.vim/autoload/pathogen.vim
~/.vim/autoload/pathogen.vim:
	mkdir -p ~/.vim/autoload ~/.vim/bundle
	curl -Sso ~/.vim/autoload/pathogen.vim \
	    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim


vim-ctrlp: vim-pathogen ~/.vim/bundle/ctrlp.vim
~/.vim/bundle/ctrlp.vim:
	git clone https://github.com/kien/ctrlp.vim.git $@

vim-Align: ~/.vim/bundle/Align
~/.vim/bundle/Align:
	git clone https://github.com/vim-scripts/Align.git $@

vim-tagbar: ~/.vim/bundle/tagbar
~/.vim/bundle/tagbar:
	git clone https://github.com/majutsushi/tagbar.git $@

