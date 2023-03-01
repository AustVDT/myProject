The SQUAMOSA promoter binding protein family is a group of transcription factors that are highly conserved across all lineages of land plants. I am currently working on characterizing the function of two cell-death inducing members from tomato, SlySBP8b and SlySBP12a. I am interested in an alignment of the promoter sequences of related SBPs from tomato, Nicotiana benthamiana, and Arabidopsis thaliana as an outgroup. Tomato and N. benthi fasta sequences were obtained from the Sol Genomics Network database, and A. thaliana sequences from TAIR, a dedicated Arabidopsis database. 

Data includes: 16 members from A. thaliana, 16 members from S. lycosperium, and 40 samples from N. benthi

Data is fasta files of assembled genomic sequence data

Made fasta file with DNA sequences of all Nicotiana benthamiana SBP genes named Nb_SBP_seq.fasta
Also downloaded fasta file of N. benthi SBP amino acid and named Nb_SBP_AA.fasta


Produce Alignment of N. benthi DNA sequence with ClustalW
$ cd C:/Users/austm/Documents/"UW Grad School"/Coursework/"2023 Spring"/Phylo563/myProject/Data
$ C:/Users/austm/Documents/"UW Grad School"/Software/ClustalW/clustalw2 -ALIGN -INFILE=Nb_SBP_seq.fasta -OUTFILE=Nb_SBP_seq_aligned.fasta -OUTPUT=FASTA

Generates an aligned fasta file 

Nucleotide sequence alignment with MUSCLE failed, so attempted alignment with amino acid sequence

Amino Acid Alignment with MUSCLE
$ cd C:/Users/austm/Documents/"UW Grad School"/Coursework/"2023 Spring"/Phylo563/myProject/Data
$ C:/Users/austm/Documents/"UW Grad School"/Software/Mesquite_Folder/muscle3.8.31_i86win32 -in Nb_SBP_AA.fasta -out Nb_SBP_AA_aligned.fasta

Generated aligned amino acid file for Nicotiana benthamiana