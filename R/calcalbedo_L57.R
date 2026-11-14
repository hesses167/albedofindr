# Write function then document
#' Calculate albedo for Landsat 5 and 7
#'
#' @param image a Landsat 5 or 7 image
#' @return calculate albedo from \code{image}, for Landsat 5 and 7 narrow to broadband conversion
#' @export
#'

calcalbedo_L57 <- function(image) {
  fill_mask <- image$select("SR_B1")$gt(0L)
  blue <- image$select("SR_B1")$multiply(0.0000275)$add(-0.2)
  red <- image$select("SR_B3")$multiply(0.0000275)$add(-0.2)
  nir <- image$select("SR_B4")$multiply(0.0000275)$add(-0.2)
  swir1 <- image$select("SR_B5")$multiply(0.0000275)$add(-0.2)
  swir2 <- image$select("SR_B7")$multiply(0.0000275)$add(-0.2)
  qa <- image$select("QA_PIXEL")
  cloud <- qa$rightShift(ee$Number(5))$bitwiseAnd(ee$Number(1))$eq(ee$Number(0))
  albedo_pre <- blue$multiply(0.356)$add(red$multiply(0.130))$add(nir$multiply(0.373))$
    add(swir1$multiply(0.085))$add(swir2$multiply(0.072))$subtract(0.0018)
  albedo <- albedo_pre$divide(1.016)$rename("albedo")
  albedo$max(ee$Image(0))$min(ee$Image(1))$
    updateMask(cloud$And(fill_mask))$
    copyProperties(image, list("system::time_start"))
}
