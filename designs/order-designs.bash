#go from a folder full of designs, wt PBDs, and fasta files, 
# appropriately named, to a transcriptic order! 

source ~/.bashrc

for des in *des*pdb; do 
  SCAFFOLD="${des:0:4}"
  MUTATIONS="$( diff_pdb ${des:0:4}.pdb $des )"
  FASTA=$( python3 align-fasta.py ../seq/nucleotide/${des:0:4}.fasta ../seq/protein/${des:0:4}.fasta ) 

  python3 -m core.makeoligo <( echo $FASTA ) <( echo $MUTATIONS ) $SCAFFOLD
done
