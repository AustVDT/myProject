The SQUAMOSA promoter binding protein family is a group of transcription factors that are highly conserved across all lineages of land plants. I am currently working on characterizing the function of two cell-death inducing members from tomato, SlySBP8b and SlySBP12a. I am interested in an alignment of the promoter sequences of related SBPs from tomato, Nicotiana benthamiana, and Arabidopsis thaliana as an outgroup. Tomato and N. benthi fasta sequences were obtained from the Sol Genomics Network database, and A. thaliana sequences from TAIR, a dedicated Arabidopsis database. 

Data includes: 16 members from A. thaliana, 16 members from S. lycosperium, and 40 samples from N. benthi

Data is fasta files of assembled genomic sequence data

Made fasta file with CDS sequences of Arabidopsis thaliana, Solanum lycopersicum, and Nicotiana benthamiana SBP genes named Fam_SBP_CDS.fasta


Produce Alignment of SBP CDS sequence with ClustalW
$ cd C:/Users/austm/Documents/"UW Grad School"/Coursework/"2023 Spring"/Phylo563/myProject/Data
$ C:/Users/austm/Documents/"UW Grad School"/Software/ClustalW/clustalw2 -ALIGN -INFILE=Fam_SBP_CDS.fasta -OUTFILE=Fam_SBP_CDS_aligned.fasta -OUTPUT=FASTA

Generates an aligned fasta file 


Running IQ-TREE 2 on example data
$  C:/Users/austm/Documents/"UW Grad School"/Software/iqtree-2.2.0-Windows/bin/iqtree2 -s  C:/Users/austm/Documents/"UW Grad School"/Software/iqtree-2.2.0-Windows/example.phy

Run IQ-Tree2 with default parameters on my dataset
$  C:/Users/austm/Documents/"UW Grad School"/Software/iqtree-2.2.0-Windows/bin/iqtree2 -s  C:/Users/austm/Documents/"UW Grad School"/Coursework/"2023 Spring"/Phylo563/myProject/Data/Fam_SBP_CDS_aligned

Generated preliminary tree in text file format