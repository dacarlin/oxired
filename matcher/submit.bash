#!/bin/bash

#$ -cwd 
#$ -S /bin/bash
#$ -e logs
#$ -o logs
#$ -N design
#$ -t 1-615 

str=$( awk -v s="${SGE_TASK_ID}" 'NR==s' run.txt )

export ROSETTA_DB3=/share/archive2/siegellab/Rosetta/main/database
export PATH=$PATH:/share/archive2/siegellab/Rosetta/main/source/bin

for ff in $( ls *flags ); do #flag file
  mkdir $ff-out
  rosetta_scripts.linuxgccrelease @ $ff \
    -in:file:s $str -out:path:all $ff-out \
    -extra_res_fa ${str:0:4}.params 
done
