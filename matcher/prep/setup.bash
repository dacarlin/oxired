# systematic matcher 

source ~/.bashrc
pdbs=$( cat list.txt )

pos() {
  pymol $1.pdb -cd "save $1.fasta; sele sele, br. /////H25 around 9; save sele.pdb, sele"
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
  pos $pdb 
  match $pdb 
done

