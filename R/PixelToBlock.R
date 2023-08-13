#' PixelToBlock
#'
#' @param x pixel vector of size 3.
#'
#' @return character vector corresponding to the block filename.
#' @export PixelToBlock
#'
#' @examples
#'
#' green = c(0, 1, 0)
#' PixelToBlock(green)
#'
PixelToBlock <- function(x) {
  # Maps a pixel (RGB vector of size 3) to a block in the MC space.
  # Get squared distance of x to each block
  squared_dist = apply(as.matrix(BlockToColour[c('red', 'green', 'blue')]), 1, function(m) sqrt(sum((x-m)^2)))
  # Find index of minimum value
  closest.idx = which.min(squared_dist)
  # Return block that is closest
  BlockToColour$file[closest.idx]
}
