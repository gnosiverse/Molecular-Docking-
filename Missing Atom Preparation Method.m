Procedure :
#Step-1
Download Modeller from https://salilab.org/modeller/download_installation.html
#Step-2
Create a file into pc named repair and keep those file are contaning missing residues
 open pymol then put the file 
then click S to select all residue here you will be seeing Amino acids previously you will see some 00000000000000000000000 IS WATER MOLECULE 
then there missing between amino acids number such as 131----137 here 5 residue missing in Sumbol it will be seen as AHDRRF-----ASJSFHFS
NOW   you are confirmed where those residues are missing. Also open the PDB file in the notepad you will those residue missing here indicated in latter 
#Step-3
in the google search by the receptor name RCSB PDB click on it 
download in the fasta format
open that file in to the note pad then you will those component are withing that were written 
#step-4
go to the Salilab.orgv > documentation >Wiki> Search > Missing residue > you will see a code :

#Script 1: 
from modeller import *
# Get the sequence of the 1qg8 PDB file, and write to an alignment file
code = '1DNU.PDB'                                                                                   
e = Environ()
m = Model(e, file=code)
aln = Alignment(e)
aln.append_model(m, align_codes=code)
aln.write(file=code+'.seq')

 ///[Here  '1qg8'    is the sample receptor where residue missing]
#step-5
Now  create a python file named script1.py in the repair folder paste the code
based on the pdb file you will have to put the name in the code = 'replace the 1qg8'   

click in the right three dot option in the folder and uncheck the Hide extensions for know file
then you will see .txt besides the script1.py cut that and same only script1.py
#step-6
now find the Modeller application file  > bin > repair. this repair file will be empty you have to paste every file fom  the previous repair file 
#step-7
search on pc modeller command promt now run as adminstration :

#COMMAND  :
C:\Program Files\Modeller10.5>
C:\Program Files\Modeller10.5>cd bin

C:\Program Files\Modeller10.5\bin>cd repair

C:\Program Files\Modeller10.5\bin\repair>dir

Directory of C:\Program Files\Modeller10.5\bin\repair
--------
C:\Program Files\Modeller10.5\bin\repair>mod10.5(VERSION)  script1.py


 Here a ln the main modeller folder there will be two new file one log file other one is seq file 
#step-8
Now go google and search the EMBOSS NEEDLE 
here two portion where you have to put first the sequence from the seq file of protein 
then in the next portion put the sequance from the fasta file 
then submit 
#step-9
create a file name alignment.ali 
#step-10
then open the .seq file from the modeller flder and copy the sequence and paste to the alignment.ali in the normal file and put star last of the sequence
#step-11
copy code from modeller wiki missing residue site for alignment.ali before pasted seq     and then after the seq
    >P1;1qg8
     structureX:1qg8: 2 :A: 256 :A:undefined:undefined:-1.00:-1.00
--------------------seq
      >P1;1qg8_fill
      sequence:::::::::
paste------ fasta sequence

now according to the embross website make the point where residue is missing 
save

#step-12
create Script2.py   paste :

from modeller import *
from modeller.automodel import *    # Load the AutoModel class

log.verbose()
env = Environ()

# directories for input atom files
env.io.atom_files_directory = ['.', '../atom_files']

a = LoopModel(env, alnfile = 'alignment.ali',
              knowns = '1qg8', sequence = '1qg8_fill')
a.starting_model= 1
a.ending_model  = 1

a.loop.starting_model = 1
a.loop.ending_model   = 2
a.loop.md_level       = refine.fast

a.make()

#step-13 
do both new file paste to the modeller folder 

#step-14
Back to the command promt
and write      C:\Program Files\Modeller10.5\bin\repair>mod10.5(VERSION)  script2.py
here will some file wil avaiable but its log will show fill score which one is low is the best

#step-15
create script3.pypaste 

from modeller import *
from modeller.automodel import *    # Load the AutoModel class

log.verbose()
env = Environ()

# directories for input atom files
env.io.atom_files_directory = ['.', '../atom_files']

class MyModel(AutoModel):
    def select_atoms(self):
        return Selection(self.residue_range('133:A', '135:A'),  missing points
                         self.residue_range('217:A', '230:A')) missing points

a = MyModel(env, alnfile = 'alignment.ali',
            knowns = '1qg8', sequence = '1qg8_fill')
a.starting_model= 1
a.ending_model  = 1

a.make()
save

#step-16
back command promt write 

C:\Program Files\Modeller10.5\bin\repair>mod10.5(VERSION)  script3.py
here the log file will be shown
 now compare the protein.ent with the low scored file which fully repaired








Refrences:
1] https://www.youtube.com/watch?v=45YE5s4KMYE
