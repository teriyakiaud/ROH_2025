#!/bin/bash
#SBATCH --mem=4GB
#SBATCH --tasks-per-cpu=10
#SBATCH --job-name=MAF0.01_prune
#SBATCH --time=00:30:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=audrey.tjahjadi@yale.edu

PLINK="PLINK/1.9b_6.21-x86_64" #1.9 version
prefix="PIBv1_global_minFIL_allCHR_with_Vanuatu"  #bedfile prefix

#MAF and LD pruning for PLINK files, sample filtering was done in the previous step
#outputs a prune.in and prune.out file
plink --threads 10 --indep 50 2 2 --maf 0.01 --bfile ${prefix} --make-bed --out ${prefix}_MAF0.01
