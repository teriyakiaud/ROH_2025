#!/bin/bash
#SBATCH --job-name=MAF0.01_LDprune
#SBATCH --mem-per-cpu=2G
#SBATCH --time=00:30:00
#SBATCH --output=MAF0.01_LDpruning_full

PLINK="PLINK/1.9b_6.21-x86_64" #1.9 version

module load ${PLINK}

./MAF_prune.sh ./PIBv1_global_minFIL_allCHR_with_Vanuatu 

./LD_prune.sh ./PIBv1_global_minFIL_allCHR_with_Vanuatu


#for some reason this doesn't produce the intermediate files with just MAF0.01 and the .prune.in file so they will not appear in the folder
#but after checking file size of the outputs after running commands separately, the final MAF0.01_LD files are correct so it seems like the files from the first just aren't stored 
