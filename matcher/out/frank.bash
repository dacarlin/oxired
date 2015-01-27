for design in $( cat lookat-list.txt ); do 
  ( grep ^ATOM ../../scaffolds/${design:0:4}_0001.pdb && grep ^HETA $design.pdb )> franks/$design-frank.pdb
  python3 parent.py $design.pdb "$( tail +4 $design.pdb | head -1 | awk '{print $6}' )" > franks/$design.lua
done 


