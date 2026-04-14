### ------------------------------------------ ###
#  CLOUD COMPARE IN R FOR BATCH PROCESSING
#    CANUPO Leaves-wood separation routine 
### ------------------------------------------ ###

### 1.FUNCTIONS ----------------------------------------------------------------
#### 1.1 SubSampling -SS ----------
reduceResolution <- function(input_file){
  system(paste(cloudcompare, "-O", input_file, "-SS SPATIAL 0.1"))
}

#### 1.2 Canupo classify (without confidence) ----------
canupoClassify <- function(input_file, classifier){
  file <- normalizePath(input_file)
  classi <- normalizePath(classifier)
  system(paste(cloudcompare, "-O", file, "-NO_TIMESTAMP", "-CANUPO_CLASSIFY", classi))
  #system(paste(cloudcompare, "-O", file, "-NO_TIMESTAMP", "-CANUPO_CLASSIFY -USE_CONFIDENCE 0.9 ", classi))
}

### 2. CLOUD COMPARE IN R ------------------------------------------------------
#### 2.2 Path to CloudCompare executable ----------
cloudcompare <- "flatpak run org.cloudcompare.CloudCompare "

# Path to functions
source("./2_scripts/2_Leaves_wood_sep_CloudComPy_CANUPO_R_CC_Functions.R")

#### 2.2 Leaves-wood classification ---------------
# Set path to trees point clouds 
trees_path <- "./3_results/1_Trees_segmented"
files <- paste0(trees_path, "/", list.files(trees_path))

# Set path to CANUPO classifier
classifier_prm <- "./1_sample_data/Canupo_classifier_Coihue.prm"

# Apply the CANUPO classification function 
lapply(files, canupoClassify, classifier = classifier_prm)

# Note: Manual editing in CloudCompare may be required to correct potential segmentation errors
