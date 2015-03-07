from sys import argv

with open( argv[1] ) as fn:
  for line in fn:
    name, *lis =  enumerate( line.strip().split(',') )
    for i, j in lis:
      print( '%s_%d %s' % ( name[1], i, j ) )
