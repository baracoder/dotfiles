all: vim configs programs wallpaper


wallpaper:
	make -C wallpaper

configs: ~/.zshrc.grml
	./relink

programs: opt/bitpocket opt/gcinvoice opt/autojump opt/pulseaudio-ctl

vim: ~/.vim/autoload/plug.vim
	ln -sf ~/.vim ~/.config/nvim
	ln -sf ~/.vimrc ~/.config/nvim/init.vim

~/.vim/autoload/plug.vim:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

~/.zshrc.grml:
	wget -O ~/.zshrc.grml http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc




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


.PHONY: wallpaper
