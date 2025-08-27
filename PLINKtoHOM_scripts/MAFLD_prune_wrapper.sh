#!/bin/bash
#SBATCH --job-name=MAF0.01_LDprune
#SBATCH --mem-per-cpu=2G
#SBATCH --time=00:30:00
#SBATCH --output=MAF0.01_LDpruning_full

#input: prefix for the output files from VCFtoPLINK2_convert.sh (i.e. BED/BIM/FAM)
#output: MAF and LD pruned PLINK1.9 files
PLINK="PLINK/1.9b_6.21-x86_64" #1.9 version

module load ${PLINK}

./MAF_prune.sh ./PIBv1_global_minFIL_allCHR_with_Vanuatu 

./LD_prune.sh ./PIBv1_global_minFIL_allCHR_with_Vanuatu

