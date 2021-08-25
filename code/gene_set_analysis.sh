#!/bin/bash

Gene_Results_File="miR137_PGC_SCZ_w3.genes.raw"
Set_Annot_File="/data/your-name/analysis-results/set_gene_list_4_magma.txt"
Output_Prefix="miR137_100k_20k_gene_set_results"

magma \
	--gene-results $Gene_Results_File \
	--set-annot $Set_Annot_File col=2,1 \
	--out $Output_Prefix
