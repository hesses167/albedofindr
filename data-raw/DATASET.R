## code to prepare `DATASET` dataset goes here

## The sample polygon used here is the burn area of a single wildfire
## which took place in 1995.
## Monitoring albedo in the years following a wildfire can help us
## understand how quickly the region recovered, and what the net
## impacts of the fire are on the regional surface energy budget.
## the sf library is needed to read shapefiles

library(sf)

sample_polygon_1995 <- sf::st_read("./data-raw/simplified_polygon_1995.shp")
usethis::use_data(sample_polygon_1995, overwrite = TRUE)

## median_albedo_1995fireyear_1997 is the output TIF containing median albedo
## 2 years after the 1995 fire
## My research tracks albedo in the 20 years post fire, so 2 years was chosen
## somewhat arbitrarly for illustrative purposes, but mostly because my dear
## partner was born in 1997 :)




