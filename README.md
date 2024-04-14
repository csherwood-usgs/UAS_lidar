# UAS_lidar
Code to process lidar data from UAS

### Discussion points
What lidar data do we want to distribute?
* Raw point cloud (any attempt to remove noise / artifacts? No...this is a a subjective process.) At this point, that is the point cloud we get from minimal processing with the YellowScan. Unless it is too big. How big is too big? (Maximum size on ScienceBase is 5 GB, right?)

What types of lidar products do we want to create?  
* DSM for best comparison with SfM
* DSM for best comparison with e.g. USACE bare earth
* "Best" DSM
* Raster of canopy heights

Per USGS, all data should be UTM, ellipsoid 18, NAVD88
