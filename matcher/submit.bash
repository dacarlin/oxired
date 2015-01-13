#!/bin/bash

#$ -cwd 
#$ -S /bin/bash
#$ -e logs
#$ -o logs

export ROSETTA_DB3=/share/archive2/siegellab/Rosetta/main/database
export PATH=$PATH:/share/archive2/siegellab/Rosetta/main/source/bin

CST=$( awk 'NR=="'${SGE_TASK_ID}'" { print $2 }' combos.txt ) 
STRUCTURE=$( awk 'NR=="'${SGE_TASK_ID}'" { print $1 }' combos.txt )

rosetta_scripts.linuxgccrelease @ design.flags \
  -in:file:s $STRUCTURE \
  -extra_res_fa in/${STRUCTURE:0:4}.params \
  -out:path:all out \
  -enzdes::cstfile $CST \
  -out:user_tag $CST
