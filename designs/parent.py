from core.db.amino_acid import THREE_to_ONE
from sys import argv 

parent = []
with open(argv[1]) as fn:
  for line in fn:
    line = line.split()
    if line[0] == 'ATOM':
      parent += [ '{"%s", %s}' % (THREE_to_ONE(line[3]), line[5]) ]

parent = set(parent)
print('parent_table={' + ', '.join(parent) + '}')
