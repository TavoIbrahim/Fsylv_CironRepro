#!/bin/bash

#########################
### KINSHIP ESTIMATES ###
#########################

# 1.- Make a vcf with a Plink format
prefix=Fsylvatica90.filtered2
./plink2 --vcf $prefix.vcf --allow-extra-chr \ # input was the same vcf that was created with SNPfiltR in R (901 indvs, 124 SNPs)
--set-missing-var-ids @:# \
--make-bed \
--out $prefix

./plink --bfile $prefix --recode vcf --allow-extra-chr --out ${prefix}a

# 2.- Re-order the SNPs in ascending way using arrange function in R

# 3.- Use bcftools to add INFO flags
bgzip Fsylvatica90.filtered2a.vcf
tabix Fsylvatica90.filtered2a.vcf.gz
bcftools +fill-tags Fsylvatica90.filtered2a.vcf.gz >> Fsylvatica90.filtered3.vcf

# 4.- Run kindred to compute kinship matrix
bcftools +fill-tags ../data/pre_input.vcf.gz >> ../data/input.vcf

./kindred -i Fsylvatica90.filtered3.vcf.gz -o pre
# ESTE ES SOLO UN EJEMPLO

# Please, mute steps 1-3 if you already have  created the input file
