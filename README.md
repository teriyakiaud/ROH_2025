# ROH_2025: Runs of Homozygosity (ROH) in Near Oceanic populations

This repository holds code and data files used for analyzing ROH in Near Oceanic populations using PLINK<sup>**</sup>. This includes the analyses listed below:
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
This directory holds the bash scripts that were used to convert VCF input to PLINK format and call ROH in the order below:
1. Convert VCF to PLINK2 pgen files and then convert to PLINKv1.9: <span style="background-color: lightskyblue;">VCFtoPLINK2_convert.sh</span>
2. Filter PLINK1.9 BED/BIM/FAM files for LD and MAF 0.01: <span style="background-color: lightskyblue;">MAFLD_prune_wrapper.sh</span>
3. Produce .hom and .hom.indiv files with ROH calls as input for all downstream analyses: <span style="background-color: lightskyblue;">PLINK_homozyg_no_Vanuatu_500Kb.sh</span>

### Analysis markdown files
These files hold both bash and R scripts for each step of the analyses described above. Rmd files include additional comments and details. 
1. Quantitative analyses and visualization of sum ROH and total number ROH: <span style="background-color: lightskyblue;">ROH_sum_stat.Rmd</span>
2. <span style="background-color: lightskyblue;">ROH_hs_cs.Rmd</span>
3. <span style="background-color: lightskyblue;">GTEx_eQTL_intersect.Rmd</span>

All data is using the hs37d5 reference genome, except for when specified. In these cases, liftover was used to lift to GRCh38.
