#!/bin/bash

mkdir temp_annot # make a temporary directory to host the intermediate files

Data_File="/data/your-name/magma/aux-files/g1000_eur"
Annot_File="miR137_100k_20k.genes.annot"
SNP_Pval_File="/data/your-name/PGC3/PGC3_SCZ_wave3_public.2021.v2.tsv"
Output_Prefix="miR137_PGC_SCZ_w3"

# run magma in parallel, 8 threads in this case
parallel magma \
	--batch {} 8 \
	--bfile $Data_File \
	--gene-annot $Annot_File \
	-- gene-model snp-wise=mean \
	-- pval $SNP_Pval_File ncol=Nca \
	--out temp_annot/$Output_Prefix \
	::: {1..8}

# merge all intermediate files generated under the temp_annot files
# and send out for one single file set
magma \
	--merge temp_annot/$Output_Prefix \
	--out temp_annot/$Output_Prefix

# extract merged files for subsequent analysis
cp temp_annot/$Output_Prefix.genes.* .

# remove the temporary directory
rm -r temp_annot
