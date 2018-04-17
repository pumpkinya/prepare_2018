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
cd $HOME/bin/
if [[ $(uname) == 'Darwin' ]];
then
    JKBIN_TAR_GZ=$HOME/prepare/resource/jkbin-darwin-2011.tar.gz
    if [ ! -e ${JKBIN_TAR_GZ} ];
    then
        wget -N https://github.com/egateam/egavm/releases/download/20170907/jkbin-darwin-2011.tar.gz
    fi
else
    JKBIN_TAR_GZ=$HOME/prepare/resource/jkbin-ubuntu-1404-2011.tar.gz
    if [ ! -e ${JKBIN_TAR_GZ} ];
    then
        wget -N https://github.com/egateam/egavm/releases/download/20170907/jkbin-ubuntu-1404-2011.tar.gz
    fi
fi
echo "==> untar from ${JKBIN_TAR_GZ}"
tar xvfz ${JKBIN_TAR_GZ} x86_64/axtChain
tar xvfz ${JKBIN_TAR_GZ} x86_64/axtSort
tar xvfz ${JKBIN_TAR_GZ} x86_64/axtToMaf
tar xvfz ${JKBIN_TAR_GZ} x86_64/chainAntiRepeat
tar xvfz ${JKBIN_TAR_GZ} x86_64/chainMergeSort
tar xvfz ${JKBIN_TAR_GZ} x86_64/chainNet
tar xvfz ${JKBIN_TAR_GZ} x86_64/chainPreNet
tar xvfz ${JKBIN_TAR_GZ} x86_64/chainSplit
tar xvfz ${JKBIN_TAR_GZ} x86_64/chainStitchId
tar xvfz ${JKBIN_TAR_GZ} x86_64/faToTwoBit
tar xvfz ${JKBIN_TAR_GZ} x86_64/lavToPsl
tar xvfz ${JKBIN_TAR_GZ} x86_64/netChainSubset
tar xvfz ${JKBIN_TAR_GZ} x86_64/netFilter
tar xvfz ${JKBIN_TAR_GZ} x86_64/netSplit
tar xvfz ${JKBIN_TAR_GZ} x86_64/netSyntenic
tar xvfz ${JKBIN_TAR_GZ} x86_64/netToAxt

mv $HOME/bin/x86_64/* $HOME/bin/
