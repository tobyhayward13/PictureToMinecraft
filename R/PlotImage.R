#' PlotImage
#'
#' Plots an RGB image (rgbimage)
#'
#' @param image rgbimage
#'
#' @importFrom graphics plot.new
#' @importFrom graphics plot.window
#' @importFrom graphics points
#'
#' @return plot
#' @export PlotImage
#'
#' @examples
#'
#' image = ImportPicture(system.file("pictures", "pngexample.png", package="PictureToMinecraft"))
#' PlotImage(image)
#'
PlotImage <- function(image) {
  # Raise error if not rgbimage
  if (class(image) != 'rgbimage') stop("image is not of class rgbimage!")

  op <- par('mar')
  on.exit(par(mar = op))
  par(mar = rep(0, 4))

  plot.new()
  plot.window(xlim = range(1:dim(image)[1] + .5),
              ylim = range(1:dim(image)[2] - .5))

  image.hex = ToHexImage(image)

  # Transpose Image
  image.hex = t(image.hex)

  for (y in 1:dim(image)[1]) {
    for (x in 1:dim(image)[2]) {
      colour = image.hex[x,y]
      rect(x, dim(image)[1]-y, x+1, dim(image)[1]+1-y, col = colour, border = colour)
    }
  }
}
