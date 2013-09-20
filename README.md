dotfiles
--------

My collection of scripts to manage configuration files on multiple
systems. Feel free to use it as your own template, reuse and adapt.


How to use
----------
Clone repo to ~/.dotfiles

    git clone https://github.com/wertarbyte/gc2latex.git ~/.dotfiles

Configuration files in cfgs/ have the same structure as in $HOME but
without the leading dot. If you run make, they will get symlinked.

You can add additional commands to the make file.

Run dotfiles to update configs and sync


How to bin
----------
To use the programs in bin/ without typing the full path, add the bin/
directory to your $PATH variable

    export $PATH=..../bin:$PATH


How to local configs?
---------------------
shells can source additional files. Put something like this in your
config to check if a local file exists and use it:

    [ -f ~/.profile.local ] && source ~/.profile.local



The MIT License (MIT)
---------------------

Copyright (c) $DATE Herman Fries

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


