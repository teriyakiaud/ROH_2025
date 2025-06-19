#!/bin/bash
#SBATCH --job-name=PIBv1_global_minFIL_allCHR_no_Vanuatu_MAF0.01_LDpruned_ROH
#SBATCH --mem=4G
#SBATCH --cpus-per-task=10
#SBATCH --time=30:00
#SBATCH --output=PIBv1_global_minFIL_allCHR_no_Vanuatu_MAF0.01_LDpruned_ROH_500Kb.log

#input files have been MAF and LD filtered
#prefix and out_prefix should be modified to fit the prefix of .bed/.bim./.fam PLINK files
PLINK="PLINK/1.9b_6.21-x86_64"
prefix="[input_file_prefix]"  #not provided, add in the full path to BED/BIM/FAM files
out_prefix="PIBv1_global_autosomes_50_het0_no_Vanuatu"

module load ${PLINK}

#produce hom files
plink --threads 10 \
--not-chr 23 \
--homozyg \
--homozyg-kb 500 \
--homozyg-snp 50 \
--homozyg-window-snp 50 \
--homozyg-window-het 0 \
--homozyg-window-missing 5 \
--homozyg-window-threshold 0.05 \
--homozyg-density 5000 \
--homozyg-gap 5000 \
--bfile ${prefix} \
--out ${out_prefix}_500Kb
