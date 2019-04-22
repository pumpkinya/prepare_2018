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

```bash
cd
```

* Install Ubuntu packages
```bash
bash prepare_2018/1-apt.sh | tee log-1-apt.txt
```

* Build unity
```bash
bash prepare_2018/2-unity.sh
```

* Install [`Linuxbrew`](http://linuxbrew.sh/)
```bash
echo '==> Install Linuxbrew'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

test -d ~/.linuxbrew && PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
test -r ~/.profile && echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.profile
echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.profile

if grep -q -i linuxbrew $HOME/.bashrc; then
    echo "==> .bashrc already contains linuxbrew"
else
    echo "==> Update .bashrc"
    echo >> $HOME/.bashrc
    echo '# Linuxbrew' >> $HOME/.bashrc
    echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >> $HOME/.bashrc
    echo "export MANPATH='$(brew --prefix)/share/man'":'"$MANPATH"' >> $HOME/.bashrc
    echo "export INFOPATH='$(brew --prefix)/share/info'":'"$INFOPATH"' >> $HOME/.bashrc
    echo "export HOMEBREW_NO_ANALYTICS=1" >> $HOME/.bashrc
    echo >> $HOME/.bashrc
fi
```

* Install CLI apps via Homebrew/Linuxbrew
```bash
bash prepare_2018/3-brew.sh | tee log-3-brew.txt
```

* Install [`Perl`](perl/) [`Python`](python/) and [`R`](r/)
```bash
bash prepare_2018/perl/install.sh | tee log-perl.txt
bash prepare_2018/python/install.sh | tee log-python.txt
bash prepare_2018/r/install.sh | tee log-r.txt
```


* Install bioinformatics apps via Homebrew science and homebrew-tap. Install Trinity manually.
```bash
bash prepare_2018/4-genomics.sh | tee log-4-genomics.txt
```
  
* Do other clones and downloads
```bash
bash prepare_2018/5-clone.sh | tee log-5-clone.txt
bash prepare_2018/6-download.sh | tee log-6-download.txt
```

* Install other bioinfomatics softwares
```bash
bash prepare_2018/7-bioinfo.sh | tee log-7-bioinfo.txt
```

* Install GATK4. GATK4 contains a copy of the Picard toolkit.
```bash
aria2c -x 4 https://github.com/broadinstitute/gatk/releases/download/4.1.1.0/gatk-4.1.1.0.zip
## It might take many times because the connection is very poor. Or you can download it by a Windows PC.
unzip gatk-4.1.1.0.zip
echo >> $HOME/.bashrc
echo "# GATK4" >> $HOME/.bashrc
echo "export PATH='$(HOME)/gatk-4.1.1.0'":'"$PATH"' >> $HOME/.bashrc
echo >> $HOME/.bashrc
source .bashrc
```

* Install MySQL and Ensembl
```bash
bash prepare_2018/8-mysql.sh | tee log-8-mysql.txt
bash prepare_2018/9-ensembl.sh | tee log-9-ensembl.txt       # Optional, needed by alignDB
```

## Building steps is completed.
