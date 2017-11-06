# How to install 'stack' for Arch/Manjaro Linux

(more information see https://aur.archlinux.org/packages/ncurses5-compat-libs/)

###### I. install stack:

$ sudo pacman -S stack

###### II. in case of an error like: 

"unable to find installation URLs for OS key: linux64-ncurses6-nopie"

###### IIa. install of the AUR package 'ncurses5-compat-libs': 

$ yaourt -S ncurses5-compat-libs

###### IIb. there will be an missing GPG error (Effective Okt. 2017), solve it by manual GPG-Key install: 

$ gpg --keyserver keys.gnupg.net --recv-keys 702353E0F7E48EDB

###### III. proof the install by: (maybe there will follow some installations)

$ stack repl
