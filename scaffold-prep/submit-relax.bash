#!/bin/bash

#$ -cwd 
#$ -S /bin/bash
#$ -e logs
#$ -o logs
#$ -N relax
#$ -t 1-31 

str=$( awk -v s="${SGE_TASK_ID}" 'NR==s' list.txt )

export ROSETTA_DB3=/share/archive2/siegellab/Rosetta/main/database
export PATH=$PATH:/share/archive2/siegellab/Rosetta/main/source/bin

cd $str 
relax.linuxgccrelease -jd2:ntrials 3 -in:file:s for-relax.pdb -constrain_relax_to_start_coords 1 -extra_res_fa NAX.params
cd .. 
