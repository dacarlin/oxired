count = 0 
for key, orig in pairs(parent_table) do
  cur = string.upper(structure.GetAminoAcid(key))
  if cur == orig[1] then
    --
  else
    print("Mutation: ", orig[1], "to", cur, "at", key)
    structure.SetAminoAcid(key, orig[1])
    count = count + 1 
  end
end

print("Displaying native residues as", count, "mutations to this design")
print("Revert as necessary and save PDB to designs/")
