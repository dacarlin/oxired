import argparse
import glob
import re

parser = argparse.ArgumentParser()
parser.add_argument( 'xray', help='X-ray structure as PDB' )
args = parser.parse_args()

with open( 'raw/%s.pdb' % args.xray, 'r' ) as xray:
  hetatms = [ line for line in xray if line.startswith('HETATM') ] 

with open( "%s.pdb" % args.xray, 'w' ) as ligand:
  for hetatm in hetatms:
    if re.search('NAD|NAP|NAI|NDP', hetatm) and hetatm[21] == 'A': 
      if hetatm[16] in ['A', ' ']:
        print( hetatm, file=ligand, end='' ) 

    
