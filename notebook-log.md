The SQUAMOSA promoter binding protein family is a group of transcription factors that are highly conserved across all lineages of land plants. I am currently working on characterizing the function of two cell-death inducing members from tomato, SlySBP8b and SlySBP12a. I am interested in an alignment of the promoter sequences of related SBPs from tomato, Nicotiana benthamiana, and Arabidopsis thaliana as an outgroup. Tomato and N. benthi fasta sequences were obtained from the Sol Genomics Network database, and A. thaliana sequences from TAIR, a dedicated Arabidopsis database. 

Data includes: 28 members from A. thaliana, 16 members from S. lycosperium, and 40 samples from N. benthi

Data is fasta files of assembled genomic sequence data

Made fasta file with CDS sequences of Arabidopsis thaliana, Solanum lycopersicum, and Nicotiana benthamiana SBP genes named Fam_SBP_CDS.fasta
  Using a Chlamydomonas reinhardtii Copper Responsive Regulator (CrCRR1) with some similarity to SBP proteins

Navigate to Data Folder
$ cd C:/Users/austm/Documents/"UW Grad School"/Coursework/"2023 Spring"/Phylo563/myProject/Data

Align with Muscle
   Description: Multiple sequence alignment software that uses UPGMA based iterative refinement of trees
   Reference: Edgar R (2004) MUSCLE: multiple sequence alignment with high accuracy and high throughput. Nucleic Acids Research. 32(5):1792–1797.
   Strengths: Very fast with a large amount of taxa, while still scoring high on accuracy. Chosen for speed and because the Muscle outputs seem to work better with downstream tree generation
   Weaknesses: Software prioritizes speed for initial tree generation, and errors in this step are carried throughout
   Assumptions: UPGMA iterative refinement assumes a constant rate of evolution
   User Choices: Has default options for running fast and accurate, but can be optimized

$ C:/Users/austm/Documents/"UW Grad School"/Software/Mesquite_Folder/muscle3.8.31_i86win32 -in Fam_SBP_CDS.fasta -out Fam_SBP_CDS_aligned_muscle.fasta

Optional software: Clustal W
   Description: 
   Reference: Thompson J, Higgens D, & Gibson T (1994) CLUSTAL W: improving the sensitivity of progressive multiple sequence alignment through sequence weighting, position-specific gap penalties and weight matrix choice. Nucleic Acids Research. 22(22): 4673–4680.
   Strengths: 
   Weaknesses: 
   Assumptions: 
   User Choices: 

Produce Alignment of SBP CDS sequence with ClustalW
$ C:/Users/austm/Documents/"UW Grad School"/Software/ClustalW/clustalw2 -ALIGN -INFILE=Fam_SBP_CDS.fasta -OUTFILE=Fam_SBP_CDS_aligned.fasta -OUTPUT=FASTA

Generates an aligned fasta file 

IQ-TREE 2 for Maximum Likelihood
   Description: Versatile and fast Maximum Likelihood software for tree generation.
   Reference: Minh B et al (2020) IQ-TREE 2: New Models and Efficient Methods for Phylogenetic Inference in the Genomic Era. Molecular Biology and Evolution, 37(5):1530–1534
   Strengths: Utilizes an NNI hillclimbing algorithm with random perturbation to prevent local optima in tree sampling. 
   Weaknesses: Samples a set of trees with random perturbations, but stops after a set maximum value and output tree. Cannot guarantee a global optimum tree
   Assumptions: Automatically tests models and picks the best for your dataset. Assumes unrooted trees 
   User Choices: By default picks top taxa for outgroup, but can be specified

Running IQ-TREE 2 on example data
$  C:/Users/austm/Documents/"UW Grad School"/Software/iqtree-2.2.0-Windows/bin/iqtree2 -s  C:/Users/austm/Documents/"UW Grad School"/Software/iqtree-2.2.0-Windows/example.phy

Run IQ-Tree2 with default parameters on my dataset
$  C:/Users/austm/Documents/"UW Grad School"/Software/iqtree-2.2.0-Windows/bin/iqtree2 -s  C:/Users/austm/Documents/"UW Grad School"/Coursework/"2023 Spring"/Phylo563/myProject/Data/Fam_SBP_CDS_aligned_muscle.fasta

Generated preliminary tree in text file format - approximation of tree with text and Newick format

Tree is viewed by Interactive Tree of Life viewer - input Newick format
   Letunic and Bork (2021) Nucleic Acids Res. doi: 10.1093/nar/gkab301 --> https://itol.embl.de/

Running MrBayes on example data
   Description: Bayesian method of phylogenetic inference. Uses MCMC to approximate posterior probabilites
   Reference: Ronquist F and Huelsenbeck J (2003) MrBayes 3: Bayesian phylogenetic inference under mixed models. Bioinformatics. 19(12):1572-1574
   Strengths: Supports many models and is highly optimizable. Uses heated chain in MCMC to explore the tree space
   Weaknesses: Computationally expensive, requires detailed priors. Requires conversion to Nexus file format. Load muscle aligned file into this website: 
   Assumptions: Old versions assume homogenous data, and automatically assume prior is correct
   User Choices: Need to chose appropriate models and priors for data, and choose parameters for MCMC approximation


Required the use of Windows Subsystem for Linux (WSL) to properly run and download

Code for this segment was run in Ubuntu window to run Homebrew and MrBayes

Navigate into data folder
$ cd /mnt/c/Users/austm/Documents/'UW Grad School'/Coursework/'2023 Spring'/Phylo563/myProject/Data

MrBayes Block:
mbmblock.txt

begin mrbayes;
 set autoclose=yes;
 prset brlenspr=unconstrained:exp(10.0);
 prset shapepr=exp(1.0);
 prset tratiopr=beta(1.0,1.0);
 prset statefreqpr=dirichlet(1.0,1.0,1.0,1.0);
 lset nst=2 rates=gamma ngammacat=4;
 mcmcp ngen=1000000 samplefreq=10 printfreq=100 nruns=1 nchains=3 savebrlens=yes;
 outgroup CrCRR1;
 mcmc;
 sumt;
end;

Run with no data, to check priors with Tracer Software
Had to remove mcmc and sumt line from mbblock in sample file, to stop mcmc from
Open .p files generated by running MrBayes with no data

Running MrBayes
Same block as before, just changed samplefreq to 100 and printfreq to 1000

mb Fam_SBP_CDS_mb.nex
Takes a long time! - 2hr 35min run time

Generated many output files, which can be read by FigTree


