library(MetaCycle)
setwd("../callaband/Desktop/UCSD/ZarrinparLab/Circadian_IHC/data/Metabolome/")

mol_Air = read.table("../Metabolome/MetaCycle/unique_no_blanks_relfreq_Air.txt", 
                     header = T, sep="\t", row.names = 1)
mol_IHC = read.table("../Metabolome/MetaCycle/unique_no_blanks_relfreq_IHC.txt", 
                     header = T, sep="\t", row.names = 1)

str(mol_Air)

mol_Air_file = "../Metabolome/MetaCycle/unique_no_blanks_relfreq_Air.txt"
mol_IHC_file = "../Metabolome/MetaCycle/unique_no_blanks_relfreq_IHC.txt"
metaout = "../Metabolome/MetaCycle/metaout"

my_timepoints1 = as.numeric(gsub("X", "", gsub("\\..", "", colnames(mol_Air))))
my_timepoints2 = as.numeric(gsub("X", "", gsub("\\..", "", colnames(mol_IHC))))
#list of zt times

meta2d(infile=mol_Air_file, outdir=metaout, filestyle='txt', 
       timepoints = my_timepoints1, 
       cycMethod = "JTK")

meta2d(infile=mol_IHC_file, outdir=metaout, filestyle='txt', 
       timepoints = my_timepoints2, 
       cycMethod = "JTK")
