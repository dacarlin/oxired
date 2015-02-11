#go from a folder full of designs, wt PBDs, and fasta files, 
# appropriately named, to a transcriptic order! 

source ~/.bashrc

for des in *des*pdb; do 
  # chop nucleotide fasta 
  python3 align-fasta.py ../seq/nucleotide/${des:0:4}.fasta ../seq/protein/${des:0:4}.fasta 

  diff-pdb ${des:0:4}.pdb $des > this_mutant.txt
  printf "%s-" "${des:0:4}" 
  python3 ~/Documents/mo/makeoligo.py chopped.fasta this_mutant.txt

  # clean up 
  #rm this_mutant.txt chopped.fasta
done
