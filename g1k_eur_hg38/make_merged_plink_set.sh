#!/bin/bash

# Siwei Zhang 24 Aug 2021

rm mergelist.txt

for i in {1..22}
do
	echo 1000G.EUR.hg38.$i >> mergelist.txt
done

plink --merge-list mergelist.txt --make-bed --out g1k_eur_hg38
