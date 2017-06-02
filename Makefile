all: ~/.zshrc.grml
	./relink
	make -C wallpaper
	rm -f ~/.xsession

~/.zshrc.grml:
	wget -O ~/.zshrc.grml http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc


