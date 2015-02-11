from core.db.amino_acid import cod, aa_from_codon
import re
import argparse 

# args
parser = argparse.ArgumentParser()
parser.add_argument('nucleotide')
parser.add_argument('protein')
args = parser.parse_args()

# read in files
with open(args.nucleotide) as fn:
  fn = [ line.strip() for line in fn ] 
  nuc = ''.join( fn )

with open(args.protein) as protein:
  protein = [ l.strip() for l in protein if not l.startswith(r'>')]
  pro = ''.join( protein ).lower()

#print( "Length of nucleotide sequence: %s" % len(nuc) )
#print( "Number of codons: %s" % ( len(nuc) / 3 ) )
#print( "Length of protein: %s" % len(pro) ) 

# reading frames
codons1 = [ nuc[i:i+3] for i in range(0, len(nuc), 3) ] 
codons2 = [ nuc[i:i+3] for i in range(1, len(nuc), 3) ]
codons3 = [ nuc[i:i+3] for i in range(2, len(nuc), 3) ]

# debug 
for frame in [ codons1, codons2, codons3 ]:
  # translate this frame 
  tra = ''.join( [ aa_from_codon( i ) for i in frame if len(i) == 3 ] )
  #print( "Translation of nucleotide sequence: %s" % tra )
  #print( "Protein sequence from PDB: %s" % pro )
  result = re.search( pro[0:10], tra )  
  if result:
    chopped = nuc[ (result.start()*3 )+2:] 
    print( "Found a match starting at %d in the nuc. sequence" % result.start() )
    print( "Chopped nucleotide sequence: %s" % chopped ) 

    #translate the chopped nucleotide sequence 
    tra2 = [ aa_from_codon( chopped[i:i+3] ) for i in range(0, len(chopped), 3) 
      if len( chopped[i:i+3] ) == 3 ] 

    print( "Translation of chopped nuc. seq.: %s" % ''.join(tra2) )

    with open("chopped.fasta", 'w') as out:
      print( chopped, file=out )
