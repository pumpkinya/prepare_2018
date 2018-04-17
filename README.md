# prepare_2018
Configuration on Ubuntu 14.04.5LTS


## Software and Hardware versions

* Ubuntu: 14.04.5
* Universal USB Installer: 1.9.5.9
* Lenovo PC: V3000
* USB-Disk: Sandisk

## Install Ubuntu

* Use Universal USB Installer 1.9.5.9 to build Ubuntu 14.04.5LTS.
  * See more from https://universal-usb-installer.en.softonic.com/
  
## Steps on Ubuntu

```basn
cd ~
```

* Install Ubuntu packages
```bash
bash prepare_2018/1-apt.sh | tee log-1-apt.txt
```

* Build unity
```bash
bash prepare_2018/2-unity.sh
```

* Install Linuxbrew
```bash
echo '==> Install Linuxbrew'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

test -d ~/.linuxbrew && PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
test -r ~/.profile && echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.profile
echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.profile
```

* Install CLI apps via Homebrew/Linuxbrew
```bash
bash prepare_2018/3-brew.sh
```

* Install [`Perl`](perl/) [`Python`](python/) and [`R`](r/)
```bash
bash prepare_2018/perl/install.sh
bash prepare_2018/python/install.sh
bash prepare_2018/r/install.sh
````

* vim plugins
```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```

* Install bioinformatics apps via Homebrew science and homebrew-tap. Install Trinity, GATK and picard manually
```bash
bash prepare_2018/4-genomics.sh
```
  
* Do other clones and downloads
```bash
bash prepare_2018/5-clone.sh
bash prepare_2018/6-download.sh
```

* Install MySQL and Ensembl
```bash
bash prepare_2018/7-mysql.sh
bash prepare_2018/8-ensembl.sh        # Optional, needed by alignDB
```

## Building steps is completed.
