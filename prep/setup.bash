# problem 1: fetch a bunch of PDBs and get ready for relax & dock

# answer 1:

source ~/.bashrc
#id=${1,,} # lowercase 
pdbs=$( cat list.txt )

fetch() { 
  curl -O http://www.rcsb.org/pdb/files/$1.pdb 
  grep '^ATOM\|^HETA' $1.pdb > clean.pdb
}

clean() {
  grep ^ATOM $1.pdb > atm.pdb 
  grep '^ATOM\|^HETA' $1.pdb > clean.pdb
  grep 'NAP\|NAD' clean.pdb > nax.pdb 
  awk '{ if ( substr($0, 22, 1) == "A") { print $0 };}' atm.pdb nax.pdb > clean-a.pdb
}

inspect() {
  pymol -d 'clean; orient resn NAD; orient resn NAP' $1 
}

ligand() {
  grep ^HETA clean-a.pdb > nax.pdb 
  obabel nax.pdb -O nax.mol -h 
} 

inspect_lig() { 
  /Applications/Avogadro.app/Contents/MacOS/Avogadro nax.mol 
}

params() {
  python $rpy/molfile_to_params.py -n NAX nax.mol 
}

relax() {
  grep ^ATOM clean-a.pdb > for-relax.pdb 
  cat NAX_0001.pdb >> for-relax.pdb
} 

dock() {
  grep '^ATOM\|^HETA' for-relax_0001.pdb > for-dock.pdb
  cat ../oxi.pdb >> for-dock.pdb 
  cp ../OXI.params . 
  cp ../dock.xml . 

  X=$( grep C19 for-relax_0001.pdb | awk '{ print $7 }' )
  Y=$( grep C19 for-relax_0001.pdb | awk '{ print $8 }' )
  Z=$( grep C19 for-relax_0001.pdb | awk '{ print $9 }' )

  rosetta_scripts.macosclangrelease -jd2:ntrials 3 -parser:protocol dock.xml -in:file:s for-dock.pdb -extra_res_fa NAX.params OXI.params -parser:script_vars x=$X y=$Y z=$Z
}

make_scaffold() {
  grep '^ATOM\|HETATM' for-dock_0001.pdb > s-$( pwd | rev | cut -d/ -f1 | rev ).pdb
  cp NAX.params cf-$( pwd | rev | cut -d/ -f1 | rev ).params 
}

copy_out() {
  cp s-*.pdb ../scaffolds
  cp cf-*.params ../scaffolds
}


for pdb in $pdbs; do 
  # mkdir $pdb
  cd $pdb
  # fetch $pdb
  # clean $pdb
  # inspect clean-a.pdb  
  # ligand 
  # inspect_lig
  # params 
  # relax 
  # dock 
  # make_scaffold 
  copy_out
  cd ..
done


exit 


echo Please nominate an atom to dock the oxirane to 
read FUCKING_ATOM

X=$( awk '/"'$FUCKING_ATOM'"/ { print $7 }' for-dock.pdb ) 
Y=$( awk '/"'$FUCKING_ATOM'"/ { print $8 }' for-dock.pdb )
Z=$( awk '/"'$FUCKING_ATOM'"/ { print $9 }' for-dock.pdb )

rosetta_scripts.macosclangrelease -jd2:ntrials 3 -parser:protocol dock.xml -in:file:s for-dock.pdb -extra_res_fa NAX.params OXI.params -parser:script_vars x=$X y=$Y z=$Z
# what's the best way to run -nstruct 3 and output only the lowest energy?
cp for-dock_0001.pdb scaffold-$id.pdb 

echo "Opening PyMOL"
echo 'sele.pdb will be saved automatically, feel free to overwrite'
pymol scaffold-$id.pdb -d "save $id.fasta; sele sele, br. /////H25 around 8; save sele.pdb, sele" 
awk '/CA/ { print $6 }' sele.pdb | sort | uniq > $id.pos

echo "Mutating the enzyme for each motif"
for p in $( cat $id.pos ); do
  for d in HIS; do 
    printf "REMARK 0 MATCH TEMPLATE X NAX 1 MATCH MOTIF Y OXI 1 1 1\nREMARK 0 MATCH TEMPLATE A %s %d MATCH MOTIF Y OXI 1 2 1\n" $d $p > ${id}${p}h.pdb
    gawk 'BEGIN { FIELDWIDTHS="13 2 2 3 2 4 54" } { \
      if ( $6+0=="'$p'" ) { \
        if ( $2=="N "||$2=="CA"||$2=="C "||$2=="O ") { \
            $4="'$d'"; \
            print $1 $2 $3 $4 $5 $6 $7 \
          } \
        else next \
      } \
      else print $0 \
    }' scaffold-$id.pdb >> ${id}${p}h.pdb # bad hard coding for histidine throughout
  done
done
ls *h.pdb > run.txt 
NUMBER="$( wc -l run.txt | awk '{ print $1 }' )"

if [[ $NUMBER > 0 ]]; then
  cd .. && rsync -avz $id $ep:
  echo "Rsynced $NUMBER structures and associated files to Epiphany"
  echo "All done, grab a beverage!" # ( finished in $(( 3 + 3 )) seconds)
  echo "---"
  echo "You can run design with"
  echo "cd $id && qsub -N or-$id -t 1-$NUMBER submit.bash"
  echo "cd $id && qsub -N or-$id -t 1-$NUMBER submit.bash" | pbcopy
  echo "(copied to clipboard)"
  #$NUMBER new jobs are running based on scaffold $id ($(( date +%s - $SECONDS )) seconds)
else
  echo Errors
