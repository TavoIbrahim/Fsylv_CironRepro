#!/bin/bash

# Filtro de calidad (mac=5)
vcftools --vcf ../data/raw_data.vcf --mac 5 --recode --out ../out/filtered_mac5
