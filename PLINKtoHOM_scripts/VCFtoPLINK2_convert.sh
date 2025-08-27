#!/bin/bash
#SBATCH --job-name=VCFtoPLINK2_convert
#SBATCH --time=4:30:00
#SBATCH --mem-per-cpu=8GB
#SBATCH --mail-type=ALL
#SBATCH --output=VCFtoPLINK2_full_out.log

#PLINK2 version of conversion from vcf to PLINK2 to merge to PLINK1 format
PLINK2="PLINK/2_avx2_20221024"
module load ${PLINK2}

#make individual chromosome pgen files, PLINK2 makes pgen format not bed
# input is a text file with a list of paths to per chromosome VCF files
#--set-missing-var-ids '@_#_$r_$a' is a plink specific tag to replace missing IDs that may cause plink errors down the line
#--const-fid 0 sets sample IDs to IID and FID is all 0
#--make-pgen vzs sets compression
#--min-alleles/max-alleles 2 filters bi-allelic vars only
#--snps-only means snps only, no structural variants
#--remove gets rid of all sample IDs contained in the text file (related/contaminated individuals)
index=1

while read -r i; do
plink2 --threads 10 --set-missing-var-ids '@_#_$r_$a' --const-fid 0 --make-pgen vzs --snps-only --min-alleles 2 --max-alleles 2 --remove PIBv1_samples_to_exclude.txt --vcf $i --out PIBv1_global_phased_minFIL_chr$index
((index++))
done < fullVCF_list_final_phased.txt > VCFtoPLINK2_convert.log


#merge individual chr files together
#pfile-vzs is the compressed mode for --pmerge-list
#--pmerge-list has a list of files from chr2 onwards to merge with chr1
#outputs a pfile-vzs of all chromosome
#--pmerge-output-vzs 
plink2 --threads 10 --pfile PIBv1_global_phased_minFIL_chr1 vzs --pmerge-list PIBv1_global_phased_minFIL_list.txt pfile-vzs --pmerge-output-vzs --out PIBv1_global_minFIL_allCHR > PLINK2merge.log

#convert to PLINK 1.9 bed format
#outputs BED/BIM/FAM files for input into next PLINK step
plink2 --threads 10 --pfile PIBv1_global_minFIL_allCHR vzs --make-bed --out PIBv1_global_minFIL_allCHR_no_Vanuatu > PLINK2PLINK1_convert.log
