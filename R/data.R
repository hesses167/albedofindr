#' Sample polygon 1995
#'
#' A shapefile featuring one burnt area polygon from a 1995 wildfire
#'
#' @format An sf object, only geometry is used in this package:
#' \describe{
#'    \item{geometry}{Geometry of the burn polygon, in WGS84, which is GEE's native CRS}
#' }
#' @keywords datasets
#' @source National Burned Area Composite
"sample_polygon_1995"


#' Median Albedo 1995 Fire Year, 1997 Image
#'
#' A TIF file containing median albedo for 1997, two years post fire
#' @format A SpatRaster object with 1 layer containing median albedo:
#' \describe{
#'    \item{med_albedo}{Median albedo at resolution set by user}
#' }
#' @keywords datasets
#' @source generated with albedofindr, through GEE
"median_albedo_1995fireyear_1997img"
