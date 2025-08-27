# ROH_2025: Runs of Homozygosity (ROH) in Near Oceanic populations

This repository holds code and data files used for analyzing ROH in Near Oceanic populations using PLINK<sup>**</sup>. This includes the XX analyses listed below:
1. We called ROH using PLINK1.9 and PLINK2 and calculated summary statistics for sum ROH, number of ROH segments, and f<sub>ROH</sub> (sum ROH >= 1.5Mb in length)
2. We examined population-level differences of ROH in different length categories.
3. We characterized the genome-wide distribution of ROH to identify ROH hotspots and coldspots
4. We performed an gene-set enrichment analysis for protein-coding genes found within ROH hotspots and coldspots and also for genes targeted by eQTLs found in hotspots and coldspots.

** This project is companion to other work (submitted, unpublished). As such, the initial input VCF files, data processing, etc. can be found at [https://github.com/YourePrettyGood/PIBv1_manuscript](https://github.com/YourePrettyGood/PIBv1_manuscript) 

## Repo Organization

This repository is organized into:

1. Data files
2. Scripts to call ROH
3. Analysis workflows in R Markdown format

### Data Files
This directory holds

### Scripts to call ROH
This directory holds the scripts that were used to convert VCF input to PLINK format and call ROH in the order below:
1. Convert VCF to PLINK2 pgen files and then convert to PLINKv1.9: <span style="background-color: lightskyblue;">VCFtoPLINK2_convert.sh</span>.

### Analysis markdown files
