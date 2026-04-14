### ------------------------------------------ ###
# UNDERSTORY VOXELIZATION
### ------------------------------------------ ###

### 1.LIBRARIES ----------------------------------------------------------------
library(lidR)
library(VoxR)
library(dplyr)
library(rgl)

### 2.VOXELIZATION ------------------------------------------------------------
#### 2.1 Path to sample point-cloud ----
tree_path <- "./3_results/1_Understory_segmented/"
files <- list.files(tree_path)
path <- paste0(tree_path, files)

understory_sample <- readLAS(path)

# Creating a VoxR dataframe from point-cloud
las_df <- as.data.frame(cbind(understory_sample$X, understory_sample$Y, understory_sample$Z))
colnames(las_df) <- c("X", "Y", "Z")

#### 2.2 Voxelization ----
# Voxel resolution 
res <- 0.02 # 2cm
voxels <- VoxR::vox(las_df, res = res, full.grid = FALSE)  

# Plot 
plot_voxels(voxels, alpha = 0.5, type = "w", lwd = 0.02, lcol = "#7A8B8B")
rgl::par3d(windowRect = c(100, 100, 1080, 1080)) # Tamaño de la ventana

points3d(las_df$X, las_df$Y, las_df$Z, col = "darkgreen", size = 0.7)
rgl::par3d(windowRect = c(100, 100, 1080, 1080)) # Tamaño de la ventana


# Delete voxels with less than n points
n_points <- 5
voxels_filter <- voxels %>% filter(npts >= n_points)

### 3. VOXEL VOLUME ESTIMATION -------------------------------------------------
# Volume estimation
num_voxels <- length(voxels$x)
num_voxels_filter <- length(voxels_filter$x)

vol_vox <- res ^ 3
volume <- num_voxels_filter * vol_vox

print(paste0("Number of original voxels: ", num_voxels))
print(paste0("Number of voxels with more than  ", n_points, " points: ", num_voxels_filter))
print(paste0("Volume per voxel: ", vol_vox, " - Understory voxel volume: ", volume, " m3"))