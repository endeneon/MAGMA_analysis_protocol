#!/bin/bash

SNP_Loc_File="/data/your-name/magma-aux-files/SNP_Loc_File"
Gene_Loc_File="/data/your-name/magma-aux-files/Gene_Loc_File"
Output_Prefix="miR137_100k_20k"

magma \
	--annotate window=100,20\
	--snp-loc $SNP_Loc_File \
	-- gene-loc $Gene_Loc_File\
	-- out $Output_Prefix
