#!/bin/bash

# Filtro de calidad (mac=2)
vcftools --vcf ../data/raw_data.vcf --mac 2 --recode --out ../out/filtered_mac2
