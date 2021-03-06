import glob 
import json
import argparse
import re
from core.db.amino_acid import THREE_to_one, cod, aa_from_codon, rc 

parser = argparse.ArgumentParser()
parser.add_argument( '--only', help='provide a scaffold name whose designs should be considered')
args = parser.parse_args()

orders = [] # final output will be a list of dicts 

if args.only:
  designs = glob.glob('%s*des*pdb' % args.only ) # or feed in list, up to you
else:
  designs = glob.glob('*des*pdb')

for design in designs:
  scaffold = design[0:4] 

  # diff the design and wt PDB 
  with open( design ) as design, open( '../scaffolds/%s_0001.pdb' % scaffold ) as wt: #renumbered scaffolds
    wt_table = { l.split()[5]: l.split()[3] for l in wt if l.startswith('ATOM') } 
    des_table = { l.split()[5]: l.split()[3] for l in design if l.startswith('ATOM') } 
    l = [] 

  for key, value in des_table.items():
    if wt_table[ key ] == value:
      pass
    else:
      l += [ '%s%s%s' % ( THREE_to_one( wt_table[ key ] ) , key, THREE_to_one( value ) ) ]

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
      print( 'The nucleotide sequence codes for %s%s%s here \n' % ( aa_from_codon( seq[i-2] ), ori, aa_from_codon( seq[i] )) )
      ditch = True 

  if l:
    e = rc(''.join(seq[min(l)-6:max(l)+4]))                                                      
    e = re.sub(r'([atcg]{15})[atcg]{0,}([atcg]{15})', r'\1,\2', e)                               
    list_of_oligos = e.split(r',')                                                               
                                                                                                 
  mutant_handle = '+'.join(switches)                                                             
  if not ditch:
    orders += [ { 'handle': mutant_handle, 'oligos': list_of_oligos, 'ssDNA': scaffold } ]


# print out final order
print( json.dumps( orders, indent=2 ) ) 

#os = {}
#for i in orders:
#  for j in i['oligos']:
#    os.update( { j: { 'ssDNA': i['ssDNA'], 'handle': i['handle'] } } ) 
#print( os ) 
