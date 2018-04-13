# prepare_2018
configuration on Ubuntu 14.04.5LTS


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
cd ~
```

* Install Ubuntu packages
```bash 
bash /prepare_2018/1-apt.sh | tee log-1-apt.txt
```

* Build unity
```bash
bash /prepare_2018/2-unity.sh
```

* Install Linuxbrew and install CLI apps via Homebrew/Linuxbrew
```bash
echo '==> Install Linuxbrew'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
test -d ~/.linuxbrew && PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
test -r ~/.profile && echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.profile
echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.profile


