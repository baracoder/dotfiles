all: ~/.zshrc.grml ~/helix.vim
	./relink
	rm -f ~/.xsession

~/.zshrc.grml:
	wget -O ~/.zshrc.grml http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc

~/helix.vim:
	git clone https://github.com/chtenb/helix.vim ~/helix.vim/
