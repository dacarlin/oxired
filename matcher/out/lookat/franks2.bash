for i in *_0001.pdb; do 
  ( grep ^ATOM ${i:0:4}.pdb && grep ^HETA $i ) > ${i:0:8}.pdb
done 
