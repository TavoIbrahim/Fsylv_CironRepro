#!/bin/bash

# Esta linea realiza un filtro mac=2 usando vcftools

vcftool --vcf input.vcf --mac 5 --min-depth 200 --recode --recode-info-ALL --o output
# Este script debe estar dentro del directorio bin
