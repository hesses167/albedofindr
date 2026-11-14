
<!-- README.md is generated from README.Rmd. Please edit that file -->

# What is albedo?

Albedo can be thought of as a surface reflectance value given from 0 to
1, where 0 is a perfect blackbody, and 1 is a perfect reflector. Albedo
value can tell us about the composition of the surface (i.e. broadleaf
has higher values than conifer, snow has very high values while burnt
areas are closer to 0). Albedo also plays an important role in the
surface-energy budget, by indicating how much incoming radiation is
absorbed or reflected. Values near 0 represent greater absorption, while
values near 1 represent greater reflectance. Higher albedos can
contribute to net regional cooling, while lower albedos can contribute
to net regional warming.

# albedofindr

<!-- badges: start -->

<!-- badges: end -->

The goal of albedofindr is to calculate albedo for Landsat versions 5,
7, and 8, using Liang et al’s (2001) narrowband-to-broadband conversion
linear regression. Landsat does not have a native albedo product, so it
is calculated as follows for Landsat 5, 7, and 8:

![\frac{0.356 \cdot Blue + 0.130 \cdot Red + 0.373 \cdot NIR + 0.085 \cdot SWIR1 + 0.072 \cdot SWIR2 - 0.0018}{1.016}](https://latex.codecogs.com/png.latex?%5Cfrac%7B0.356%20%5Ccdot%20Blue%20%2B%200.130%20%5Ccdot%20Red%20%2B%200.373%20%5Ccdot%20NIR%20%2B%200.085%20%5Ccdot%20SWIR1%20%2B%200.072%20%5Ccdot%20SWIR2%20-%200.0018%7D%7B1.016%7D "\frac{0.356 \cdot Blue + 0.130 \cdot Red + 0.373 \cdot NIR + 0.085 \cdot SWIR1 + 0.072 \cdot SWIR2 - 0.0018}{1.016}")

**IMPORTANT CAVEAT** : Liang et al (2001) tends to overestimate albedo
(when compared to MODIS), especially in the winter. It is highly
recommended to only use this package for summer albedo calculations.
While the calculation within the package is clamped to \[0,1\], the
equation itself is unbounded, and is therefore, unreliable. The equation
was also derived only using summer imagery.

## Important Notes

1.  **IMPORTANT CAVEAT** : Liang et al (2001) tends to overestimate
    albedo (when compared to MODIS), especially in the winter. It is
    highly recommended to only use this package for summer albedo
    calculations, as the equation was derived only using summer imagery.
    While the calculation within the package is clamped to \[0,1\], the
    equation itself is unbounded, and is therefore, is capable of
    producing unrealistic results.
2.  This package requires the use of a **Python Environment**. I
    followed [this
    tutorial](https://www.youtube.com/watch?v=olNYYynSJfI) to get set
    up.
3.  This package is dependent on **Google Earth Engine** (example given
    in Vignettes section), please use your Google Earth Engine
    credentials.

## Installation

You can install the development version of albedofindr from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("hesses167/albedofindr")
```

## Output

This package can be used to calculate albedo, compile an albedo
collection with a date range and region as set by the user, and lastly,
produce a median albedo composite TIF, also within a specified date
range and region. The output can be used for analysis, or to visually
display differences in albedo across a region of interest. Such an
example is given here:

<img src="data-raw/final_vignette" alt="" width="100%" />
