from core.db.amino_acid import THREE_to_one
from sys import argv 

parent = []
with open(argv[1]) as fn:
  for line in fn:
    line = line.split()
    if line[0] == 'ATOM':
      parent += [ '{"%s", %s}' % (THREE_to_one(line[3]), line[5]) ]

parent = set(parent)
print('parent_table={' + ', '.join(parent) + '}')
print('''
count = 0
for key, mut in pairs(parent_table) do
cur = structure.GetAminoAcid(mut[2])
  if cur == mut[1] then
    --
  else
    print("Mutation: ", mut[1], "to", cur, "at", mut[2])
    structure.SetAminoAcid(mut[2], mut[1])
    count = count + 1 
  end
end
print("Displaying native residues as", count, "mutations to this design")
''')

