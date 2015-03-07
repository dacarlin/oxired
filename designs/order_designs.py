import glob 
import argparse
import re
from core.db.amino_acid import THREE_to_one, cod, aa_from_codon, rc 

parser = argparse.ArgumentParser()
args = parser.parse_args()

designs = glob.glob('*des*pdb') 

orders = [] 

for design in designs:
  scaffold = design[0:4]

  # diff the design and wt PDB 
  with open( design ) as design, open( '%s.pdb' % scaffold ) as wt:

    a = {}
    for line in wt:
      if re.search( r'^ATOM.* CA', line ): 
        a[ line.split()[5] ] =line.split()[3]  
      
    l = [] 
    for line in design:
      if re.search( r'^ATOM.* CA', line ):
        if a[ line.split()[5] ] != line.split()[3] :
          ll = '%s%s%s' % ( THREE_to_one( a[ line.split()[5] ] ), \
            line.split()[5], THREE_to_one( line.split()[3] ) ) 
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

  orders.append( { 'scaffold': scaffold, 'mutations': mutations, 'nucleotide': chopped } )

for order in orders:
  gene = order[ 'nucleotide' ] 
  line = order[ 'mutations' ]

  seq = [ gene[i:i+3] for i in range(0, len(gene), 3) ] 
  l = []
  switches = re.split(r'\+', line)
  for switch in switches:
    old, *i, new = switch
    i = int(''.join(i))
    ori = aa_from_codon( seq[i-1] )
    assert old is ori, 'error: you say ' + old + ' but seq has ' + ori 
    seq[i-1] = cod[new].upper()
    l += [i] 

  if l:
    e = rc(''.join(seq[min(l)-6:max(l)+4]))                                                      
    e = re.sub(r'([atcg]{15})[atcg]{0,}([atcg]{15})', r'\1,\2', e)                               
    list_of_oligos = e.split(r',')                                                               
                                                                                                 
  mutant_handle = '+'.join(switches)                                                             
  j = { 'handle': mutant_handle, 'oligos': list_of_oligos, 'ssDNA': order[ 'scaffold' ] }       
  print ( j )   
