# Write function then document
#' Scale bands in Landsat 8
#'
#' @param year year of composite collection
#' @param start_month Month at start of date range
#' @param start_day Day, in month, at start of date range
#' @param end_month Month at end of date range
#' @param end_day Day, in month, at end of date range
#' @param aoi area of interest for analysis
#' @return return Landsat collection \code{image}, select Landsat version based on \code{year}
#' @export

get_albedo_collection <- function(year, start_month, start_day, end_month, end_day, aoi){
  img_collection <- get_collection(year, aoi)

  start_date_raw <- paste0(start_day, "-", start_month, "-", year)
  start_date_dmy <- lubridate::dmy(start_date_raw)

  start_date <- format(start_date_dmy, "%Y-%m-%d")

  end_date_raw <- paste0(end_day, "-", end_month, "-", year)
  end_date_dmy <- lubridate::dmy(end_date_raw)

  end_date <- format(end_date_dmy, "%Y-%m-%d")

  if(img_collection$sensor == "Landsat 8"){
    ls_col <- img_collection$col$filterDate(start_date, end_date)$map(rgee::ee_utils_pyfunc(calcalbedo_L8))
  } else {
    ls_col <- img_collection$col$filterDate(start_date, end_date)$map(rgee::ee_utils_pyfunc(calcalbedo_L57))
  }

  return(ls_col)
}
