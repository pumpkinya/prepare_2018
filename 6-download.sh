#!/usr/bin/env bash

# make sure $HOME/bin in your $PATH
if grep -q -i homebin $HOME/.bashrc; then
    echo "==> .bashrc already contains homebin"
else
    echo "==> Update .bashrc"

    HOME_PATH='export PATH="$HOME/bin:$PATH"'
    echo '# Homebin' >> $HOME/.bashrc
    echo $HOME_PATH >> $HOME/.bashrc
    echo >> $HOME/.bashrc

    eval $HOME_PATH
fi

mkdir -p $HOME/bin
mkdir -p $HOME/share


echo "==> kent bin"
for f in faToTwoBit axtChain chainAntiRepeat lavToPsl chainMergeSort chainPreNet chainNet netSyntenic netChainSubset chainStitchId netSplit netToAxt axtSort axtToMaf netFilter chainSplit; do
      wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/${f};
      mv ./${f} $HOME/bin/;
      chmod +x $HOME/bin/${f};
done


echo "==> Download RepeatMasker"
cd $HOME/prepare/resource    
wget -N -P ${BASE_DIR} http://www.repeatmasker.org/RepeatMasker-open-4-0-7.tar.gz
wget -N -P ${BASE_DIR} https://github.com/egateam/egavm/releases/download/20170907/repeatmaskerlibraries-20140131.tar.gz
