for i in $( ls *pdb | cut -c 1-4 | uniq ); do
  cp ../../scaffolds/$i.params . 
  cp ../../scaffolds/$i.pdb . 
done

diff_design() { 
  awk '/^AT.*CA/ && NR==FNR {a[$6]=$4;next} /^AT.*CA/ && $4!=a[$6] \
    { print a[$6] $6 $4 }' $1 $2 | gpaste -s -d+ | tr A-Z a-z 
}

echo fn mutations $( head -1 score.sc )
for i in $( ls *_000* ); do
  MUTATIONS=$( diff_design ${i:0:4}.pdb $i )
  SCORELINE="$( grep ${i:0:-4} score.sc )"
  printf "%s %s %s\n" $i $MUTATIONS "$SCORELINE" 
done 


