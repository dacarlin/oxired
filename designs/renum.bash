for i in $( cat ../list.txt ); do
  score.macosclangrelease -renumber_pdb 1 -out:output 1 -extra_res_fa OXI.params ${i:0:4}.params -in:file:s $i
done
