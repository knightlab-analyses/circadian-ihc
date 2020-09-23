library(MetaCycle)
setwd("../callaband/Desktop/UCSD/ZarrinparLab/Circadian_IHC/")

OTU = read.csv("../Circadian_IHC/data/Microbiome/MetaCycle/rarefied_relfreq_table.csv")
md = read.csv("../Circadian_IHC/data/Microbiome/MetaCycle/circadianIHC_metadata_cleaned.csv")

str(OTU)
str(md)


air_names <- md[md$exposure_type == 'Air',]$sample_name
air_names2 <- paste0("X", air_names)
ihc_names <- md[md$exposure_type == 'IHC',]$sample_name
ihc_names2 <- paste0("X", ihc_names)
ihc_names2

AirOTU <- OTU[, colnames(OTU) %in% air_names2]
IHCOTU <- OTU[, colnames(OTU) %in% ihc_names2]

?meta2d
?meta3d


####
OTU <- "../Circadian_IHC/data/Microbiome/MetaCycle/rarefied_relfreq_table.csv"
md = "../Circadian_IHC/data/Microbiome/MetaCycle/circadianIHC_metadata_cleaned.csv"

group_col <- "exposure_type"
dat <- read.csv(OTU, row.names = 1, check.names = FALSE)
str(dat)

mdat <- read.csv(md)
str(mdat)

groups <- levels(mdat[,group_col])

#For one group
air_names <- mdat[mdat$exposure_type == "Air",]$sample_name
air_data <- dat[, colnames(dat) %in% air_names]
gmat1 <- as.matrix(air_data)
colnames(gmat1)
idx <- match(colnames(gmat1), mdat$sample_name)
colnames(gmat1) <- mdat[idx,]$zt
str(gmat1)
write.csv(file='air_rarefied_OTU.csv', x=gmat1)

###Running meta2d
meta2d(infile='air_rarefied_OTU.csv', 
       filestyle = 'csv',
       outdir = "meta2d_metaout", 
       timepoints = "line1")
# analysisStrategy = "selfUSE", cycMethod = "JTK"

out_metacycle <- meta2d(infile='air_rarefied_OTU.csv', 
       filestyle = 'csv',
       outputFile = FALSE,
       timepoints = "line1")

jtk_data <- out_metacycle$JTK

###Running for multiple groups (Carolina)



###Running meta3d
otu_match_mdat <- mdat[mdat$sample_name %in% colnames(dat), ]
str(otu_match_mdat)
#make design file
designmdat <- otu_match_mdat[c("sample_name", 
                               "mouse_number", 
                               "zt", 
                               "exposure_type")]
designmdat$sample_name <- paste0("X", designmdat$sample_name)
write.csv(x=designmdat, file = "CA_design.csv", row.names = FALSE)



meta3d(datafile = OTU, 
       filestyle = "csv", 
       cycMethodOne = "JTK",
       designfile = "./CA_design.csv", 
       outdir = "meta3d_metaout", 
       design_libColm = 1,
       design_subjectColm = 2,
       design_hrColm =  3, 
       design_groupColm = 4)
