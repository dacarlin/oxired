if [[ $# < 1 ]]; then
  echo No name supplied for this job, using default
  NAME=name
else
  NAME=$1
fi 

combine() {
  for str in $( ls in/*h.pdb ); do
    for f in $( ls *cst ); do 
      echo $str $f 
    done
  done 
}

combine > combos.txt 

NUMBER=$( wc -l combos.txt | cut -d' ' -f1 ) 
echo Generated $NUMBER combos. Submitting with
echo qsub -t 1-$NUMBER -tc 250 -N $NAME submit.bash
qsub -t 1-$NUMBER -tc 250 -N $NAME submit.bash
