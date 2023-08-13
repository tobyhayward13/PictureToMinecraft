#' DrawBlock
#'
#' Draws a Block face given a minecraft image
#'
#' @param filename filename for image
#'
#' @return plot
#' @export DrawBlock
#'
#' @examples
#'
#' image.filename = 'grass_side_carried.png'
#' DrawBlock(image.filename)
#'
DrawBlock <- function(filename, convolute.blocks.factor = 1) {
  # Returns a plot of a "Minecraft Block Face" corresponding to the file given
  image = BlockToPNG[filename][[1]]
  # Convolute image for sake of time
  if (convolute.blocks.factor != 1) image = ConvolutePixels(image, convolute.blocks.factor)
  # Plot the image
  PlotImage(image)
}
