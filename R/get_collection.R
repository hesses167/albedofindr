# Write function then document
#' Scale bands in Landsat 8
#'
#' @param year year of composite collection
#' @param aoi area of interest for analysis
#' @return return Landsat collection \code{image}, select Landsat version based on \code{year}
#' @export

get_collection <- function(year, aoi){
  if (year < 1999){
    list(col = ee$ImageCollection("LANDSAT/LT05/C02/T1_L2")$filterBounds(aoi),
         sensor = "Landsat 5")
  } else if (year < 2013){
    list(col = ee$ImageCollection("LANDSAT/LE07/C02/T1_L2")$filterBounds(aoi),
         sensor = "Landsat 7")
  } else {
    list(col = ee$ImageCollection("LANDSAT/LC08/C02/T1_L2")$filterBounds(aoi),
         sensor = "Landsat 8")
  }

}
