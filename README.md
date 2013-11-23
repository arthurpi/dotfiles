dotfiles
========

<h1>My configuration files for vim/gvim, conky, openbox, tint2 and for input.</h1>
<h5>On linux, type in those commands to install desired configuration files.<br />You need to back up your original configuration files, then delete them from your home directory</h5>
git clone https://github.com/qrthur/dotfiles.git ~/.dotfiles/<br />
ln -s ~/.dotfiles/vimrc ~/.vimrc<br />
ln -s ~/.dotfiles/gvimrc ~/.gvimrc<br />
ln -s ~/.dotfiles/vim ~/.vim<br />
ln -s ~/.dotfiles/conkyrc ~/.conkyrc<br />
ln -s ~/.dotfiles/config ~/.config    (it will install openbox & tint2 configuration files)<br />
ln -s ~/.dotfiles/inputrc ~/.inputrc<br /><br />

Credits:
<ul>
	<li>conkyrc inspired by http://rent0n86.deviantart.com/art/My-horizontal-conkyrc-122604863</li>
	<li>openbox & tint2 configurations originally come from Crunchbang #! distro, but were largely modified</li>
</ul>
