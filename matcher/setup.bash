# systematic matcher 

source ~/.bashrc
#id=${1,,} # lowercase 
pdbs=$( cat ../list.txt )

pos() {
  pymol $1.pdb -cd "save $1.fasta; sele sele, br. /////H25 around 8; save sele.pdb, sele"
  awk '/CA/ { print $6 }' sele.pdb | sort | uniq > $1.pos
  rm sele.pdb 
}

match() {
  for p in $( cat $1.pos ); do
    for d in HIS; do 
      echo "REMARK 0 MATCH TEMPLATE X NAX 1 MATCH MOTIF Y OXI 1 1 1" > t
      printf "REMARK 0 MATCH TEMPLATE A %s %d MATCH MOTIF Y OXI 1 2 1\n" $d $p >> t 
      gawk 'BEGIN { FIELDWIDTHS="13 2 2 3 2 4 54" } { \
        if ( $6+0=="'$p'" ) { \
          if ( $2=="N "||$2=="CA"||$2=="C "||$2=="O ") { \
              $4="'$d'"; \
              print $1 $2 $3 $4 $5 $6 $7 \
            } \
          else next \
        } \
        else print $0 \
      }' $1.pdb >> t && mv t ${1}${p}h.pdb 
    done
  done
}

for pdb in $pdbs; do 
  # pos $pdb 
  match $pdb 
done

exit 

echo "Mutating the enzyme for each motif"
for p in $( cat $id.pos ); do
  for d in HIS; do 
    printf "REMARK 0 MATCH TEMPLATE X NAX 1 MATCH MOTIF Y OXI 1 1 1\nREMARK 0 MATCH TEMPLATE A %s %d MATCH MOTIF Y OXI 1 2 1\n" $d $p > ${id}${p}h.pdb
    gawk 'BEGIN { FIELDWIDTHS="13 2 2 3 2 4 54" } { \
      if ( $6+0=="'$p'" ) { \
        if ( $2=="N "||$2=="CA"||$2=="C "||$2=="O ") { \
            $4="'$d'"; \
            print $1 $2 $3 $4 $5 $6 $7 \
          } \
        else next \
      } \
      else print $0 \
    }' scaffold-$id.pdb >> ${id}${p}h.pdb # bad hard coding for histidine throughout
  done
done
ls *h.pdb > run.txt 
NUMBER="$( wc -l run.txt | awk '{ print $1 }' )"

if [[ $NUMBER > 0 ]]; then
  cd .. && rsync -avz $id $ep:
  echo "Rsynced $NUMBER structures and associated files to Epiphany"
  echo "All done, grab a beverage!" # ( finished in $(( 3 + 3 )) seconds)
  echo "---"
  echo "You can run design with"
  echo "cd $id && qsub -N or-$id -t 1-$NUMBER submit.bash"
  echo "cd $id && qsub -N or-$id -t 1-$NUMBER submit.bash" | pbcopy
  echo "(copied to clipboard)"
  #$NUMBER new jobs are running based on scaffold $id ($(( date +%s - $SECONDS )) seconds)
else
  echo Errors
