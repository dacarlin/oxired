import glob 
import json
import argparse
import re
from core.db.amino_acid import THREE_to_one, cod, aa_from_codon, rc 

parser = argparse.ArgumentParser()
args = parser.parse_args()

orders = [] # final output will be a list of dicts 

designs = glob.glob('1l*des*pdb') # or feed in list, up to you

for design in designs:
  scaffold = design[0:4] 

  # diff the design and wt PDB 
  with open( design ) as design, open( '../scaffolds/%s.pdb' % scaffold ) as wt:

    a = {}
    for line in wt:
      spline = line.strip().split() 
      if spline[0] == 'ATOM' and spline[2] == 'CA': # re.search( r'^ATOM.* CA', line ): 
        print( line ) 
        a[ spline[5] ] = spline[3]  
      
    l = [] 
    for line in design:
      spline = line.strip().split() 
      if spline[0] == 'ATOM' and spline[2] == 'CA': # re.search( r'^ATOM.* CA', line ):
        if a[ spline[5] ] != spline[3] :
          ll = '%s%s%s' % ( THREE_to_one( a[ spline[5] ] ), \
            spline[5], THREE_to_one( spline[3] ) ) 
          l.append( ll )  

    mutations = '+'.join( l ) 

  # get sequences and align them 
  with open( '../seq/nucleotide/%s.fasta' % scaffold ) as fn:
    fn = [ line.strip() for line in fn ] 
    nuc = ''.join( fn )

  with open( '../seq/protein/%s.fasta' % scaffold ) as protein:
    protein = [ l.strip() for l in protein if not l.startswith(r'>')]
    pro = ''.join( protein ).lower()

  codons1 = [ nuc[i:i+3] for i in range(0, len(nuc), 3) ] 
  codons2 = [ nuc[i:i+3] for i in range(1, len(nuc), 3) ]
  codons3 = [ nuc[i:i+3] for i in range(2, len(nuc), 3) ]

  for frame in [ codons1, codons2, codons3 ]:
    tra = ''.join( [ aa_from_codon( i ) for i in frame if len(i) == 3 ] )
    result = re.search( pro[0:8], tra )  
    if result:
      chopped = nuc[ (result.start()*3)+2: ] 

  seq = [ chopped[i:i+3] for i in range(0, len(chopped), 3) ] 
  l = []
  ditch = False 
  switches = re.split(r'\+', mutations)
  for switch in switches:
    old, *i, new = switch
    i = int(''.join(i))
    ori = aa_from_codon( seq[i-1] )
    if old is ori:
      seq[i-1] = cod[new].upper()
      l += [i] 
    else:
      print( 'Error while validating mutant %s %s at position %d:' % ( scaffold, mutations, i ) )  
      print( 'The nucleotide sequence codes for %s here \n' % ( ori, ) )
      ditch = True 

  if l:
    e = rc(''.join(seq[min(l)-6:max(l)+4]))                                                      
    e = re.sub(r'([atcg]{15})[atcg]{0,}([atcg]{15})', r'\1,\2', e)                               
    list_of_oligos = e.split(r',')                                                               
                                                                                                 
  mutant_handle = '+'.join(switches)                                                             
  j = { 'handle': mutant_handle, 'oligos': list_of_oligos, 'ssDNA': scaffold }       
  if not ditch:
    print( json.dumps( j , indent=2, sort_keys=True ) )   
