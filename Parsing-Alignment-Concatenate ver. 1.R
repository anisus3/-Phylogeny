library(ape)
library(apex)
library(ips)

#Set the path to Gblocks
Gblocks_path = '/Users/user/Apps/Gblocks'

#Set the working directory and parameters
path = '/Users/user/Library/your/folder/path/here/'

#Set the names of genes and specimens
GeneList = c("Gene1", "Gene2", "Gene3") #replace "Gene1", "Gene2", "Gene3" with the names of the studied genes
SpecimenList = c("Snail-1", "Snail-2", "Snail-3") #replace Snail-1", "Snail-2", "Snail-3" with the names of the studied samples

#adds a table with reference sequence numbers from the Genbank from your computer
GB_request_all = read.csv(paste(path, 'Raw_DNA/References.csv', sep = ''), sep=';')
#requests the numbers of the desired gene (already for the cycle). The 'X' in the column name appears itself when loading the table. Apparently it is impossible to start with a number
GB_Data = read.GenBank(GB_request_all[ ,paste('X', GeneList[1], sep='')])

Alligment_pathes <- c()

for (Gene in 1:length(GeneList)) {
  Request_gene = read.GenBank(GB_request_all[ ,paste('X', GeneList[Gene], sep='')])
  names(Request_gene) = GB_request_all$Taxon
  write.dna(Request_gene, file = paste(path, GeneList[Gene],'_all.fa',sep = ''), format = 'fasta')

#This cycle adds your sequences to the genbank ones
    for (Specimen in 1:length(SpecimenList)) {
    SpecimenGene = read.dna(paste(path,"Raw_DNA/", GeneList[Gene],"_", SpecimenList[Specimen],'.fa', sep = ''), format='fasta')
    write.dna(SpecimenGene, file = paste(path, GeneList[Gene],'_all.fa',sep = ''), format = 'fasta', append = TRUE)
  }
  Request_gene = read.dna(paste(path, GeneList[Gene],'_all.fa',sep = ''), format = 'fasta')
  Request_gene = mafft(Request_gene)

 #This fork is for different Gblocks settings in different genes
  if (GeneList[Gene] == '16S') {
    Request_gene = gblocks(Request_gene, b1 = 0.5, b2 = 0.99, b3 = ncol(Request_gene), b4=2, b5 = "a",target = "alignment", 'Gblocks_path')
  } else {
    Request_gene = gblocks(Request_gene, b1 = 0.5, b2 = 0.99, b3 = ncol(Request_gene), b4=2, b5 = "a",target = "alignment", 'Gblocks_path')
  }
  write.dna(Request_gene, file = paste(path, GeneList[Gene],'_all.fa',sep = ''), format = 'fasta')
  Alligment_pathes = c(Alligment_pathes, paste(path, GeneList[Gene],'_all.fa',sep = ''))
}

#Reads files and combines them into one sequence
All_genes = read.multidna(Alligment_pathes, format = 'fasta')
All_genes = concatenate(All_genes)
write.dna(All_genes, file = paste(path,'all_genes.fa',sep = ''), format = 'fasta')
