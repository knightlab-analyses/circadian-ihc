install.packages("MetaCycle")
install.packages("ggplot2")
library(MetaCycle)
setwd("../callaband/Desktop/UCSD/ZarrinparLab/Circadian_IHC/")

## OTU

OTU_Air = read.table("../Circadian_IHC/data/Microbiome/MetaCycle/rarefied_relfreq_table_Air.txt")
OTU_IHC = read.table("../Circadian_IHC/data/Microbiome/MetaCycle/rarefied_relfreq_table_IHC.txt")

str(OTU_Air)

OTU_Air_file = "../Circadian_IHC/data/Microbiome/MetaCycle/rarefied_relfreq_table_Air.txt"
OTU_IHC_file = "../Circadian_IHC/data/Microbiome/MetaCycle/rarefied_relfreq_table_IHC.txt"
metaout = "../Circadian_IHC/data/Microbiome/MetaCycle"

my_timepoints1 = as.numeric(gsub("X", "", gsub("\\..", "", colnames(OTU_Air))))
my_timepoints2 = as.numeric(gsub("X", "", gsub("\\..", "", colnames(OTU_IHC))))
#list of zt times

meta2d(infile=OTU_Air_file, outdir=metaout, filestyle='txt', 
       timepoints = my_timepoints1, 
       cycMethod = "JTK")

meta2d(infile=OTU_IHC_file, outdir=metaout, filestyle='txt', 
       timepoints = my_timepoints2, 
       cycMethod = "JTK")

#FAMILY

Fam_Air = read.table("../Circadian_IHC/data/Microbiome/MetaCycle/rarefied_relfreq_famtable_Air.txt")
Fam_IHC = read.table("../Circadian_IHC/data/Microbiome/MetaCycle/rarefied_relfreq_famtable_IHC.txt")

str(Fam_Air)

Fam_Air_file = "../Circadian_IHC/data/Microbiome/MetaCycle/rarefied_relfreq_famtable_Air.txt"
Fam_IHC_file = "../Circadian_IHC/data/Microbiome/MetaCycle/rarefied_relfreq_famtable_IHC.txt"
metaout2 = "../Circadian_IHC/data/Microbiome/MetaCycle/Family_metaout"

my_timepoints3 = as.numeric(gsub("X", "", gsub("\\..", "", colnames(Fam_Air))))
my_timepoints4 = as.numeric(gsub("X", "", gsub("\\..", "", colnames(Fam_IHC))))
#list of zt times

meta2d(infile=Fam_Air_file, outdir=metaout2, filestyle='txt', 
       timepoints = my_timepoints3, 
       cycMethod = "JTK")

meta2d(infile=Fam_IHC_file, outdir=metaout2, filestyle='txt', 
       timepoints = my_timepoints4, 
       cycMethod = "JTK")

#PHYLA

Phyla_Air = read.table("../Circadian_IHC/data/Microbiome/MetaCycle/rarefied_relfreq_phyla_table_Air.txt")
Phyla_IHC = read.table("../Circadian_IHC/data/Microbiome/MetaCycle/rarefied_relfreq_phyla_table_IHC.txt")

str(Phyla_Air)

Phyla_Air_file = "../Circadian_IHC/data/Microbiome/MetaCycle/rarefied_relfreq_phyla_table_Air.txt"
Phyla_IHC_file = "../Circadian_IHC/data/Microbiome/MetaCycle/rarefied_relfreq_phyla_table_IHC.txt"
metaout3 = "../Circadian_IHC/data/Microbiome/MetaCycle/Phyla_metaout"

my_timepoints5 = as.numeric(gsub("X", "", gsub("\\..", "", colnames(Phyla_Air))))
my_timepoints6 = as.numeric(gsub("X", "", gsub("\\..", "", colnames(Phyla_IHC))))
#list of zt times

meta2d(infile=Phyla_Air_file, outdir=metaout3, filestyle='txt', 
       timepoints = my_timepoints5, 
       cycMethod = "JTK")

meta2d(infile=Phyla_IHC_file, outdir=metaout3, filestyle='txt', 
       timepoints = my_timepoints6, 
       cycMethod = "JTK")
