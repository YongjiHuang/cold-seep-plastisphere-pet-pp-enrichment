# cold-seep-plastisphere-pet-pp-enrichment
Processed datasets and analysis scripts for PET/PP-degrading microbial communities enriched from deep-sea cold seep plastispheres.
Data and scripts for PET/PP-degrading bacterial communities in deep-sea cold seep ecosystems

This repository contains processed datasets and analysis scripts associated with the manuscript entitled “Diversity and distribution of potential polyethylene terephthalate and polypropylene plastic-degrading bacteria communities in deep-sea cold seep ecosystems”.

The study investigated the diversity, enrichment dynamics, and environmental distribution of putative polyethylene terephthalate (PET)- and polypropylene (PP)-associated bacterial communities from deep-sea cold seep plastispheres. The files provided here are intended to improve data transparency and reproducibility by making the processed ASV tables, taxonomic assignments, sample metadata, environmental parameters, and sequence-processing scripts publicly available.

Repository contents
data/

This folder contains processed microbial community datasets generated from 16S rRNA gene sequencing analysis.

ASV_table.tsv: ASV abundance table used for downstream community analysis.
representative_sequences.fasta: Representative ASV sequences used for taxonomic assignment and phylogenetic analysis.
taxonomy.tsv: Taxonomic classification table of ASVs.
metadata/

This folder contains sample information and environmental data used in the study.

sample-metadata.tsv: Sample metadata, including sample IDs.
environmental_parameters.tsv: Environmental geochemical parameters of cold seep seawater and sediment samples.
scripts/

This folder contains analysis scripts used for sequence processing.

Qiime_sequence_processing.sh: Shell script for QIIME 2-based processing of 16S rRNA gene sequencing data, including quality control, denoising, ASV generation, and taxonomic assignment.
Raw sequencing data

The raw 16S rRNA gene sequencing data have been deposited in National Center for Biotechnology Information (NCBI) under PRJNA1366089.

Citation

If these datasets or scripts are used, please cite the associated manuscript:

Diversity and distribution of potential polyethylene terephthalate and polypropylene plastic-degrading bacteria communities in deep-sea cold seep ecosystems.

Contact

For questions regarding the data or scripts, please contact the corresponding author of the manuscript.
