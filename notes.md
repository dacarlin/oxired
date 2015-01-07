## Visual inspection of design scaffolds

+ 1lc3 has an extra NAD 
+ 2ag8 and 2f1k appear to be the same protein? 

Other than hand-editing out the extra NAD in 1lc3, 
chain A of protein atoms and the cofactor (whether NAD or NAP
from chain A were the basis for further modelling). 

## Visual inspection of NAX

3kvo has a weird fragment 
a bunch have the wrong oxidation state (NAD+) 

Hydrogens were added by Open Babel and manually and oxidation state was 
corrected manually in Avogadro. For 3kvo, the fragment was deleted.  

Params files were generated for every scaffold except 2f1k, with
'ValueError: No acceptable neighbor atoms in molecule!' The problem was 
some atoms had multiple occupancies, which I manually edited out. 

## Relax and dock 

31 scaffolds were relaxed and the oxirane docked roughly to C19
of NAX (the action carbon) without any hiccups  

## Systematic matcher 

A small number (5-15) of mutants was generated from each scaffold by 
systematically mutating each residue within 10 Å of the action 
carbon to histidine. Functional constraints were added between the 
NAX and oxirane, and between the histidine and oxirane at this time. 

## Enzyme design 

Mutants were uploaded to Epiphany and ran through Rosetta enzyme design. 
A total of 615 mutants were processed, with XXX having all_cst scores of 
less than 10 after Monte Carlo optimization of constraints and design of
the protein-ligand interface (favoring native resiudes by 2.2 energy units). 


