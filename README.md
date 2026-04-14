# Workflow and scripts (anonymous for review)

This repository contains the code, data, and workflow needed to reproduce the pipeline suggested in the manuscript under review.  

## Repository structure
- `1_sample_data/`: sample point cloud and a CANUPO classifier
- `2_scripts/`: scripts to reproduce analysis
- `3_results/`: samples of generated outputs (trees segmented, leaves-wood classification, understory segmented, QSM tree sample)
- `4_supplementary_notes/`: additional information and notes about the scripts

### **STEP 1**. Point Cloud Segmentation in Computree and SimpleForest
- **Software:** Computree (v5) and SimpleForest
- **Software documentation:** [Computree](https://computree.onf.fr/?page_id=42) -  [SimpleForest](https://simpleforest.org/)
- **Script**: 
  - *1_COMPUTREE_SEGMENTATION_PIPELINE.xsct2*
- **Script notes**: [See Supplementary Information](4_supplementary_notes/1_Computree_notes.html)

### **STEP 2**. Tree Leaves-wood separation
- **Software:** CANUPO through CloudCompare
- **Software documentation:** [CANUPO](https://www.cloudcompare.org/doc/wiki/index.php/CANUPO_(plugin)) -  [CloudCompare](https://www.cloudcompare.org/)
- **Script**: 
  - *2_Leaves_wood_sep_CC_CANUPO_R.R*
- **Script notes**: manual editing in CloudCompare may be necessary after this step to address potential classification errors and improve the quality of the resulting point clouds.

### **STEP 3**. Tree QSM modeling
- **Software:** Computree (v5) and SimpleForest
- **Software documentation:** [Computree](https://computree.onf.fr/?page_id=42) -  [SimpleForest](https://simpleforest.org/)
- **Script**: 
  - *3_QSM_modeling_single_tree.xsct2* 
- **Script notes**: [See Supplementary Information](4_supplementary_notes/2_Computree_notes.html)

### **STEP 4**. Leaves/Crown voxelization
- **Software:** VoxR / ITSme
- **Software documentation:** [VoxR](https://academic.oup.com/aob/article/121/4/589/4107549) - [ITSme](https://besjournals.onlinelibrary.wiley.com/doi/full/10.1111/2041-210X.14026)
- **Script**: 
  - *4_Canopy_Crown_voxel.R* 
- **Script notes**:-

### **STEP 5**. Understory voxelization
- **Software:** VoxR / lidR
- **Software documentation:** [VoxR](https://academic.oup.com/aob/article/121/4/589/4107549) - [lidR](https://www.sciencedirect.com/science/article/pii/S0034425720304314)
- **Script**: 
  - *5_Understory_voxel.R* 
- **Script notes**: 