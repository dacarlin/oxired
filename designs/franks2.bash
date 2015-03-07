for i in $( cat list.txt); do 
  # grep ATOMS from wt, HETATMS from design
  ( grep ^ATOM ${i:0:4}.pdb && grep ^HETA $i ) > ${i%.pdb}-frank.pdb

  # make Lua script with grepped ATOMs from design
  python3 lua_script_writer.py $i > ${i%.pdb}.lua
done 


