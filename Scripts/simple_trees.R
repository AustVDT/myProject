install.packages("adegenet", dep=TRUE)
install.packages("phangorn", dep=TRUE)

library(ape)
library(adegenet)
library(phangorn)

pwd
dna <- fasta2DNAbin(file="http://adegenet.r-forge.r-project.org/files/usflu.fasta")

D <- dist.dna(dna, model="TN93")

tre <- nj(D)
tre <- ladderize(tre)
plot(tre, cex=.6)
title("A simple NJ tree")

#
dna <- fasta2DNAbin(file="http://adegenet.r-forge.r-project.org/files/usflu.fasta")
dna2 <- as.phyDat(dna)
