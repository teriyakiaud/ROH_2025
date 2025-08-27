#!/bin/bash
#SBATCH --mem=4GB
#SBATCH --tasks-per-cpu=10
#SBATCH --job-name=MAF0.01_LDprune
#SBATCH --time=00:30:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=audrey.tjahjadi@yale.edu

PLINK="PLINK/1.9b_6.21-x86_64" #1.9 version
prefix="PIBv1_global_minFIL_allCHR_with_Vanuatu"

module load ${PLINK}

plink --threads 10 --extract ${prefix}_MAF0.01.prune.in --bfile ${prefix}_MAF0.01 --make-bed --out ${prefix}_MAF0.01_LDpruned
