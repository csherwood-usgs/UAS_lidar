# UAS_lidar
Code to process lidar data from UAS. These codes focus on LAStool scripts.  

We could compare the workflow and products with other processing methods, e.g., using the YellowScan software, LASgui, GIS (ArcPro, Global Mapper, QGIS), other.

For the optimal workflow, we want to think about:
* Quality of the product
* Repeatability and ability to document the process
* Speed
* Ease of use

### Discussion points
What lidar data do we want to distribute?
* Raw unclassified point cloud [Do we want to make any attempt to remove noise / artifacts? No...this is a a subjective process?] At this point, the raw product is the point cloud we get from minimal processing with the YellowScan software. Unless it is too big. How big is too big? (Maximum size on ScienceBase is 5 GB, right?)
* Should we distribute any other point clouds? (e.g. classified clouds, clouds associated with raster products below?).

What types of lidar products do we want to create?  
* DSM for best comparison with SfM
* DSM for best comparison with e.g. USACE bare earth
* "Best" DSM
* Raster of canopy heights

Per USGS, all data should be UTM, ellipsoid 18, NAVD88

### Raw point cloud for publication
These are processing steps to get to a .laz file for public distribution
* [list steps to be performed in the YellowScan software to produce the raw file]
* Ensure header is valid (`lascheck`)
* Compress from ASCII .las format to compress .laz format (`laszip`)
* Compute spatial optimization and create a .lax file (`lasindex`) [Do we distribut the .lax file too?]
* Do we need to compute a boundary file (`lasboundary`)
* Now points are ready for distribution.
  - Do we need to add any metadata to the header? [Seems like four lines of "Project ID" could be changed. See https://www.asprs.org/wp-content/uploads/2010/12/asprs_las_format_v12.pdf]
  - Do we need to change the file name?
