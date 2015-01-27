#$ -S /bin/bash
#$ -cwd 
#$ -e logs
#$ -o logs 

str=$( awk 'NR=="'$SGE_TASK_ID'"' list.txt ) 

export ROSETTA_DB3=/share/archive2/siegellab/Rosetta/main/database
export PATH=$PATH:/share/archive2/siegellab/Rosetta/main/source/bin

relax.linuxgccrelease -in:file:s $str.pdb -constrain_relax_to_start_coords 1 -ignore_unrecognized_res 1 -extra_res_fa $str.params -renumber_pdb 1 
