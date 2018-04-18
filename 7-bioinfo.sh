# Some bioinfomatics hosted on low band server, so don't waste time on downloading them repeatedly.

cp $HOME/prepare/resource/blast-2.7.1.x86_64_linux.bottle.tar.gz $(brew --cache)/
cp $HOME/prepare/resource/RepeatMasker-open-4-0-7.tar.gz         $(brew --cache)/repeatmasker-4.0.7.tar.gz

brew install --force-bottle blast
brew install --force-bottle rmblast
brew install brewsci/bio/clustal-w
brew install hmmer lastz mafft raxml
brew install vcftools
brew install repeatmasker --build-from-source # run config later


echo "==> Install wang-q/tap"
brew install faops multiz sparsemem
brew install jrunlist jrange

echo "==> Config repeatmasker"
pushd $(brew --prefix)/opt/repeatmasker/libexec
rm -fr lib/perl5/x86_64-linux-thread-multi/
rm Libraries/RepeatMasker.lib*
rm Libraries/DfamConsensus.embl
popd
pushd $(brew --prefix)/Cellar/$(brew list --versions repeatmasker | sed 's/ /\//')/libexec
tar zxvf $HOME/prepare/resource/repeatmaskerlibraries-20140131.tar.gz
sed -i".bak" 's/\/usr\/bin\/perl/env/' config.txt
./configure < config.txt
popd

# TODO: remove these
rm $(brew --prefix)/bin/rmOutToGFF3.pl
sed -i".bak" 's/::Bin/::RealBin/' $(brew --prefix)/Cellar/$(brew list --versions repeatmasker | sed 's/ /\//')/libexec/util/rmOutToGFF3.pl
ln -s $(brew --prefix)/Cellar/$(brew list --versions repeatmasker | sed 's/ /\//')/libexec/util/rmOutToGFF3.pl $(brew --prefix)/bin/rmOutToGFF3.pl
