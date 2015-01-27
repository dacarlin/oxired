from core.db.amino_acid import THREE_to_one
from sys import argv 

parent = []
with open(argv[1]) as fn:
  for line in fn:
    line = line.split()
    if line[0] == 'ATOM':
      parent += ['{%d, "%s"}' % (int(line[5])-int(argv[2])+1, THREE_to_one(line[3]))]

parent = set(parent)
print('parent_table={' + ', '.join(parent) + '}')
print('''
count = 0
for throwaway, pair in pairs(parent_table) do
cur = structure.GetAminoAcid(pair[1]) 
  if cur == pair[2] then
    --
  else
    print("Looking at position", pair[1])
    print("Wild type has", pair[2])
    print("Current pose has", cur) 
    print("Mutation: ", pair[2], "to", cur, "at", pair[1])
    structure.SetAminoAcid(pair[1], pair[2])
    count = count + 1 
  end
end
print("Displaying native residues as", count, "mutations to this design")
''')

