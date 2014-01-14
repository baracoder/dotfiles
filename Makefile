all: vim configs programs

configs:
	./relink

programs: opt/bitpocket opt/gcinvoice opt/autojump opt/pulseaudio-ctl

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


opt/pulseaudio-ctl:
	git clone https://github.com/graysky2/pulseaudio-ctl.git $@
	chmod +x $@/pulseaudio-ctl
	mkdir -p opt/bin
	ln -s `pwd`/$@/pulseaudio-ctl opt/bin/pulseaudio-ctl


opt/bitpocket:
	git clone https://github.com/sickill/bitpocket.git $@
	mkdir -p opt/bin
	ln -s `pwd`/$@/bin/bitpocket opt/bin/bitpocket


opt/gcinvoice:
	mkdir $@
	curl -Ss http://www.smoerz.org/gcinvoice/gcinvoice-0.1.5.tar.gz |\
		tar -xvz --strip-components=1 -C $@


opt/autojump:
	git clone git://github.com/joelthelion/autojump.git $@
	cd $@ && ./install.sh --local

