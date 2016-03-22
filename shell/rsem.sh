#!/bin/bash
#PBS -l mem=64gb,nodes=1:ppn=20,walltime=10:00:00

file=${arg}

module load rsem
module load bowtie/1.0.0

  dir1="/data/xwang/Basespace/myeloid_set1"
# dir1="/data/xwang/Basespace/myeloid_set2"
# dir1="/data/xwang/Basespace/tcells_r123"

dir2="/data/xwang/Basespace/rsem"
ref="/data/xwang/RSEM/GRCm38"

rsem-calculate-expression -p 20 \
			  --bowtie-phred33-quals \
   			  --forward-prob 0.5 \
   			  --paired-end \
                          "$dir1"/"$file"_R1.fastq \
                          "$dir1"/"$file"_R2.fastq \
   			  "$ref" \
   			  "$dir2"/"$file"

