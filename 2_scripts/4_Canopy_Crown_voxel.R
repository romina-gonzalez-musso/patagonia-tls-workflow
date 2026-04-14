### ------------------------------------------ ###
# CROWN/LEAVES VOXELIZATION
### ------------------------------------------ ###

### 1.LIBRARIES ----------------------------------------------------------------
library(VoxR)
library(dplyr)
library(rgl)
library(ITSMe)

### 2.VOXELIZATION ------------------------------------------------------------
#### 2.1 Path to sample leaves point cloud ----
tree_path <- "./3_results/2_Trees_leaves-wood_samples/"
trees <- list.files(tree_path, pattern = "leaves")
trees <- paste0(tree_path, trees)

sample_tree <- read_tree_pc(trees[4])

# Creating a VoxR dataframe from point-cloud
las_df <- as.data.frame(cbind(sample_tree$X, sample_tree$Y, sample_tree$Z))
colnames(las_df) <- c("X", "Y", "Z")

#### 2.2 Voxelization ----
# Voxel resolution 
res <- 0.025 # 2.5 cm
voxels <- VoxR::vox(las_df, res = res, full.grid = FALSE)  

# Plot 
plot_voxels(voxels, alpha = 0.5, type = "b", lwd = 0.02, lcol = "black", fcol = "#A2CD5A")
rgl::par3d(windowRect = c(100, 100, 1080, 1080)) 

points3d(las_df$X, las_df$Y, las_df$Z, col = "darkgreen", size = 0.7)
rgl::par3d(windowRect = c(100, 100, 1080, 1080)) # Tamaño de la ventana

# Delete voxel with less than n points
n_points <- 2
voxels_filter <- voxels %>% filter(npts >= n_points)

### 3. VOXEL VOLUME ESTIMATION -------------------------------------------------
# Volume estimation
num_voxels <- length(voxels$x)
num_voxels_filter <- length(voxels_filter$x)

vol_vox <- res ^ 3
volume <- num_voxels_filter * vol_vox

print(paste0("Number of original voxels: ", num_voxels))
print(paste0("Number of voxels with more than  ", n_points, " points: ", num_voxels_filter))
print(paste0("Volume per voxel: ", vol_vox, " - Crown voxel volume: ", volume, " m3"))

### 4. CROWN ALPHA VOLUME ESTIMATION -------------------------------------------
# Crown
Crown <- list(crownpoints = sample_tree)
Crown_pc <- Crown$crownpoints

# Projected Crown Area
CrownArea <- projected_area_pc(pc = sample_tree, plot = TRUE)

# Crown height
H <- tree_height_pc(pc = sample_tree, plot = TRUE) 
H$plot

# Crown Alpha-Volume
CrownVol <- alpha_volume_pc(pc = sample_tree, plot = TRUE)
CrownVol$av


