# Write function then document
#' Write all integers between two integers
#'
#' @param a A number, integer
#' @param b A number, integer
#' @return All integers between \code{a} and \code{b}
#' @export
#' @examples
#' counttoten(4, 6)
#' counttoten(2, 8)
counttoten <- function(a, b){
  c(a:b)
}

