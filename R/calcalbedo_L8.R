# Write function then document
#' Calculate albedo for Landsat 8
#'
#' @param image a Landsat 8 image
#' @return calculate albedo from \code{image}, for Landsat 8 narrow to broadband conversion
#' @export
#'

calcalbedo_L8 <- function(image) {
  fill_mask <- image$select("SR_B2")$gt(0L)
  b2 <- image$select("SR_B2")$multiply(0.0000275)$add(-0.2)
  b3 <- image$select("SR_B3")$multiply(0.0000275)$add(-0.2)
  b4 <- image$select("SR_B4")$multiply(0.0000275)$add(-0.2)
  b5 <- image$select("SR_B5")$multiply(0.0000275)$add(-0.2)
  b7 <- image$select("SR_B7")$multiply(0.0000275)$add(-0.2)
  qa <- image$select("QA_PIXEL")
  cloud <- qa$rightShift(ee$Number(5))$bitwiseAnd(ee$Number(1))$eq(ee$Number(0))
  albedo_pre <- b2$multiply(0.356)$add(b3$multiply(0.130))$add(b4$multiply(0.373))$
    add(b5$multiply(0.085))$add(b7$multiply(0.072))$subtract(0.0018)
  albedo <- albedo_pre$divide(1.016)$rename("albedo")
  albedo$max(ee$Image(0))$min(ee$Image(1))$
    updateMask(cloud$And(fill_mask))$
    copyProperties(image, list("system::time_start"))
}
