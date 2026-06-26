qiime tools import \
  --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-path casava-18-paired-end-demultiplexed \
  --input-format CasavaOneEightSingleLanePerSampleDirFmt \
  --output-path multiplexed-seqs.qza

qiime demux summarize \
  --i-data multiplexed-seqs.qza \
  --o-visualization multiplexed-seqs.qzv

qiime dada2 denoise-paired \
  --p-n-threads 40 \
  --i-demultiplexed-seqs multiplexed-seqs.qza \
  --p-trim-left-f 24 \
  --p-trim-left-r 26 \
  --p-trunc-len-f 241 \
  --p-trunc-len-r 241 \
  --o-table table.qza \
  --o-representative-sequences rep-seqs.qza \
  --o-denoising-stats denoising-stats.qza

qiime metadata tabulate \
  --m-input-file denoising-stats.qza \
  --o-visualization stats-dada2.qzv

qiime feature-classifier classify-sklearn \
  --i-classifier /home/share/databases/silva/silva138.1/silva-138.1-ssu-nr99-classifier.qza \
  --i-reads rep-seqs.qza \
  --p-n-jobs 20 \
  --o-classification taxonomy.qza


qiime metadata tabulate \
  --m-input-file taxonomy.qza \
  --o-visualization taxonomy.qzv

qiime taxa barplot \
  --i-table table.qza \
  --i-taxonomy taxonomy.qza \
  --m-metadata-file sample-metadata.tsv \
  --o-visualization taxa-bar-plots.qzv

qiime tools export --input-path taxonomy.qza --output-path taxa
sed -i -e '1 s/Feature/#Feature/' -e '1 s/Taxon/taxonomy/' taxa/taxonomy.tsv
qiime tools export --input-path table.qza    --output-path table_exported
biom add-metadata  -i table_exported/feature-table.biom   -o table_exported/feature-table_w_tax.biom  --observation-metadata-fp taxa/taxonomy.tsv  --sc-separated taxonomy
biom convert    -i table_exported/feature-table_w_tax.biom    -o table_exported/feature-table_w_tax.txt    --to-tsv    --header-key taxonomy

qiime phylogeny align-to-tree-mafft-fasttree \
  --i-sequences rep-seqs.qza \
  --o-alignment aligned-rep-seqs.qza \
  --o-masked-alignment masked-aligned-rep-seqs.qza \
  --o-tree unrooted-tree.qza \
  --o-rooted-tree rooted-tree.qza
