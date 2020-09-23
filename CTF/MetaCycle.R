library(MetaCycle)
setwd("../callaband/Desktop/UCSD/ZarrinparLab/Circadian_IHC/Cameron/")

mol_Air = read.csv("./log-ratios_Air_format.csv", header=T)
mol_IHC = read.csv("./log-ratios_IHC_format.csv", header=T)

str(mol_Air)

mol_Air_file = "./log-ratios_Air_format.csv"
mol_IHC_file = "./log-ratios_IHC_format.csv"
metaout = "./MetaOut/"

my_timepoints1 = as.numeric(gsub("X", "", gsub("\\..", "", colnames(mol_Air))))
my_timepoints1 <- na.omit(my_timepoints1)
my_timepoints2 = as.numeric(gsub("X", "", gsub("\\..", "", colnames(mol_IHC))))
my_timepoints2 <- na.omit(my_timepoints2)
#list of zt times

meta2d(infile=mol_Air_file, outdir=metaout, filestyle='csv', 
       timepoints = my_timepoints1, 
       cycMethod = "JTK")

meta2d(infile=mol_IHC_file, outdir=metaout, filestyle='csv', 
       timepoints = my_timepoints2, 
       cycMethod = "JTK")
