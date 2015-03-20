mkdir clean_pdb nucleotide_fasta protein_fasta ligands ligands/raw scaffolds

for i in $( cat list.txt ); do
  #cd clean_pdb
  #python ~/Applications/Rosetta/main/source/src/python/apps/public/get_pdb.py $i A > ../protein_fasta/$i.fasta
  #cd ../ligands/raw 
  #curl -O http://www.rcsb.org/pdb/files/$i.pdb
  #cd .. #ligands
  cd ligands
  python3 ligands.py $i 
  obabel $i.pdb -O $i.mol -h
  python ~/Applications/Rosetta/main/source/src/python/apps/public/molfile_to_params.py $i.mol -n NAX
  cat ../clean_pdb/${i}A.pdb NAX_0001.pdb > ../scaffolds/$i.pdb 
  rm NAX_0001.pdb NAX.params # remove files created by molfile_to_params 
  cd ..
done 


