SCREENSIZE=$(shell xrandr |grep -m 1 \* |awk '{print $1}')

wallpaper.png:
	wget https://github.com/NixOS/nixos-artwork/raw/master/gnome/Gnome_Dark.png -O wallpaper.png
	convert wallpaper.png -resize $(SCREENSIZE) wallpaper.png
