# Write function then document
#' Scale bands in Landsat 8
#'
#' @param year year of composite collection
#' @param start_month Month at the start of date range
#' @param start_day Day, in month, at the start of date range
#' @param end_month Month at the end of date range
#' @param end_day Day, in month, at the end of date range
#' @param aoi area of interest for analysis
#' @return return Landsat collection \code{image}, select Landsat version based on \code{year}
#' @export

get_median_albedo <- function(year, start_month, start_day, end_month, end_day, aoi){
  ls_col <- get_albedo_collection(year, start_month, start_day, end_month, end_day, aoi)

  median_albedo <- ls_col$median()$rename("med_albedo")

  return(median_albedo)
}
