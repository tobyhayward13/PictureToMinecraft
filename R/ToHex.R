#' ToHex
#'
#' Take a 3D vector RGB and converyt to a single Hexidecimal string.
#'
#' @param x vector
#'
#' @return character hexcode
#' @export ToHex
#'
#' @examples
#'
#' x = 1:3 * 0.1
#' ToHex(x)
#'
ToHex <- function(x) {
  # Take a 3d vector x and convert to a string of 6 digits
  # preceded by a '#' corresponding to the hex code.

  # Helper strrev function
  strrev <- function(s) paste0(strsplit(s, '')[[1]][nchar(s):1], collapse = '')

  hexes.unit = unname(sapply(as.vector(outer(c(0:9, LETTERS[1:6]), c(0:9, LETTERS[1:6]), paste0)), strrev))

  # Add '#'
  paste0('#', paste(hexes.unit[round(255 * x)+1], collapse = ''))
}
