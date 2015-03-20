import pandas
from core.db.amino_acid import THREE_to_one as t

# functions used in filtering 
def lowest(df, percent=0.25, col='total_score'):
  return df[(df[col] < df[col].quantile(percent))]

def add_diffs( m ):
  with open( 'every_output/%s.pdb' % m ) as design, open( '../../scaffolds/%s.pdb' % m[0:4] ) as native:
    wt = { l.split()[5]: l.split()[3] for l in native if l.startswith('ATOM') } 
    des = { l.split()[5]: l.split()[3] for l in design if l.startswith('ATOM') } 
    l = [ '%s%s%s' % (t(wt[k]), k, t(v)) for k, v in des.items() if wt[k] != v ] 
  return '+'.join( l ) 

# read in and add data 
sf = pandas.read_csv('score.sc', delimiter=r'\s+', header=0)
sf['scaffold'] = sf['description'].str[0:4]

#filters 
sf = sf[( sf.all_cst < 26 )]
sf = sf.groupby('scaffold').apply(lowest)
sf['mutations'] = sf['description'].map( add_diffs ) 
#sf = sf.groupby('mutations').apply(lowest)

# output
sf.to_csv( 'filtered_scores.csv' ) 
