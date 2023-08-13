#' PlotMinecraftMap
#'
#' Takes a rgbimage matrix image bitmap image object and returns a dice map plot.
#'
#' @param image rgbimage object
#'
#' @importFrom graphics par
#'
#' @return plot
#' @export PlotMinecraftMap
#'
#' @examples
#'
#' image = ImportPicture(system.file("pictures", "pngexample.png", package="PictureToMinecraft"))
#' dim(image)
#' image.conv = ConvolutePixels(image, convolution.factor = 100)
#' dim(image.conv)
#' image.prepped = PrepareMinecraftMap(image.conv)
#' PlotMinecraftMap(image.prepped)
#'
#'
PlotMinecraftMap <- function(image, convolute.blocks.factor = 2) {
  # Plots the resulting Minecraft Block Map Image

  # Throw error if not a rgbimage or is not minecraftplot.ready
  if (class(image) != 'rgbimage' | !attr(image, "minecraftplot.ready")) stop("Not correct rgbimage type!")

  op <- par('mfrow','mar')
  on.exit(par(op))
  par(
    mfrow = dim(image),
    mar = rep(0,4)
  )
  for (pxl in t(image)) {
    DrawBlock(pxl, convolute.blocks.factor)
  }
}
