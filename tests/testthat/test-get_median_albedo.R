library(testthat)
library(rgee)
library(sf)
test_that("get_median_albedo returns a median albedo image", {

 # uncomment if you need to authenticate
 # rgee::ee_Authenticate(user = "svhesse167@gmail.com", auth_mode = "notebook")
  rgee::ee_Initialize(
    user = "svhesse167@gmail.com",
    drive = TRUE,
    project = "wildfires-albedo"
  )

  aoi <- sf_as_ee(sample_polygon_1995["geometry"])
  aoi_geometry <- aoi$geometry()$bounds()

  print(aoi$name())
  # 1997, two years post fire
  median_albedo <- get_median_albedo(
    year = 1997,
    start_month = "July",
    start_day = 1,
    end_month = "September",
    end_day = 1,
    aoi = aoi_geometry
    )

  expect_true(inherits(median_albedo, "ee.image.Image"))

  band_names <- median_albedo$bandNames()$getInfo()
  expect_true("med_albedo" %in% band_names)

  task <- ee$batch$Export$image$toAsset(
    image = median_albedo,
    description = "test_median_albedo_1995_2y_postfire",
    assetId = "projects/wildfires-albedo/assets/test_median_albedo_1995_2y_postfire",
    region = aoi_geometry,
    scale = 300,
    maxPixels = 1e13
  )

  task$start()

  expect_true(!is.null(task))
})
