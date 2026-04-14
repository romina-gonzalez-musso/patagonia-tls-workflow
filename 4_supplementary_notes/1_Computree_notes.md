
## Supplementary Information for Computree and Simpleforest pipeline

### **SEGMENTATION PIPELINE** (Script 1)

#### **Steps 1-5**: Terrain modeling

| N | Step Name | Key Parameter | Value | Comments |
|:--:|:--:|:--:|:--:|:--:|
| 1 | Import point cloud | – | – | – |
| 2 | Reduce point density | Grid resolution | 0.4 cm | Higher value = more eliminated points |
| 3 | Classify ground points (TLS) | Ground thickness | 32 | Increase in steep or mountainous plots |
| 4 | Ground point filter | Threshold angle | 25 | Should not exceed 25 |
| 5 | DTM Pyramidal Mlesac Fit | Angle | 20 | Should not exceed 20 |
|  |  |  |  |  |

#### **Steps 6-15**: Tree Cloud Segmentation

| N | Step Name | Key Parameter | Value | Comments |
|:--:|:--:|:--:|:--:|:--:|
| 6 | Cut Cloud Above DTM | Threshold height | 0.10–0.20 m | Could be higher with dense understory |
| 7 | Cut Cloud Above DTM | Threshold height | 1.50–1.90 m | Depends on trees’ average height |
| 8 | Cut Cloud Above DTM | Threshold height | 0.60–0.80 m | Depends on trees’ average height |
| 9 | Stem filter | Voxel size | 0.020 m | Decrease voxel size and search ranges slightly improves results in dense understory |
|  |  | Search range | 0.050 m |  |
|  |  | Second search range | 0.120 m |  |
|  |  | Growth direction threshold | 30–75° | Higher values retain more trunk points. Recommended in dense understories |
| 10 | Statistical outlier filter | n iterations | 15 |  |
| 11 | Radius outlier filter | Search range | 0.030 m |  |
|  |  | Minimum number | 45–60 | Higher values erase more points |
| 12 | Segmentation Euclidean clustering | Voxel size | 0.02–0.03 m |  |
|  |  | Range | 0.10–0.12 m | Increase slightly when understory interferes with base trunks |
|  |  | n | 1 |  |
| 13 | Dijkstra Based Tree Segmentation | Factor | 0.5 | For occlusion in point cloud, 0.5 is a good value |
|  |  | Voxel size | 0.03–0.04 m | Set slightly higher values if point cloud is low quality |
|  |  | Range | 0.07–0.08 m |  |
| 14 | Voronoi Based Tree Segmentation | Threshold | 0.077 m | Increase if branches are not classified |
| 15 | Height Based Tree Identification | Threshold height | 4–9 m | Depends on trees and understory average height |

#### **Steps 16-21**: Tree cloud filtering

| N | Step Name | Key Parameter | Value | Comments |
|:--:|:--:|:--:|:--:|:--:|
| 16 | Cut Cloud Above DTM | Height threshold | 1.3–1.7 m | Depends on average tree height and understory. The aim is to clean the base of the stems. Try to clean the DBH portion. |
| 17 | Stem Filter | Voxel size | 0.20 m | Decrease slightly voxel size and search ranges if the filter removes too much of the trunk. |
|  |  | Search range | 0.03–0.05 m |  |
|  |  | Second search range | 0.08–0.12 m |  |
|  |  | Threshold | 30–65° | Higher values retain more trunk points. Depends on stem cloud noise. |
| 18 | Euclidean Clustering Filter | Voxel size | 0.010–0.020 m | Lower values remove more points. |
|  |  | Range | 0.040–0.050 m | Lower values remove more points. |
| 19 | Merge Clouds from Two Groups | – | – | – |
| 20 | Statistical Outlier Filter | n | 5 | Higher values remove fewer points. |
|  |  | Factor | 5 | Higher values remove fewer points. |
|  |  | Iterations | 15 |  |
| 21 | Euclidean Clustering Filter | n | 4–5 | Higher values remove fewer points. |
