# Phylogeny
🧬 R scripts for handling with DNA sequences

This simple script solves many problems when working with short sequences of several genes and helps to reconstruct the phylogeny of living organisms.

The input is a set of separate files in the "fasta" format and a csv table with the numbers of reference sequences in the Genbank. At the output, it outputs several filtered alignments (separately for each gene and for all of them, e.g. multigenerational alignment). 

How to Use:

1. Specify the path to the installed Gblocks in the line 6. 
Alternatively, if you don't want to use Gblocks, you can comment out lines 36-40. You can also change the settings there.

2. Create a working folder on your computer and Specify its address  in line 9.

3. Create another directory inside your working folder with the name "Raw_DNA"

4. In the folder "/Raw_DNA" create file «References.csv», the first column should be called "Taxon", the rest should have the names of genes. In the columns with the names of genes, specify the GenBank Accession numbers of reference sequences.
! It is important that the numbers of all genes are indicated for all samples. The script does not know how to detect omissions.
!!If the name of the gene starts with a digit, add an "X" to the column name, for example X16S for the 16S gene.

5. In lines 12 and 13, you need to specify the names of genes and samples. The names of the genes should be the same as the table from step 2, but not have an "X" at the beginning.

6. Sequences must have extensions «.fa» and their names should be as follows: Gene_Specimen.fa, where Gene and Specimen should correspond to those specified in paragraph 3. 
For example: the name of the sample is Snail2, the name of the gene is 28S, respectively, the file with its sequence should be named "28S_Snail2.fa». Put the files in the «Raw_DNA» folder. 

7. Run the code and save a lot of time on transferring from format to format and copying them from one program to another. Watch a good movie, take a walk with friends or have a glass of wine, you deserve it.

If the instructions seem incomprehensible, do not hesitate to ask me
