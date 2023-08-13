#' PrepareMinecraftMap
#'
#' @param image rgbimage
#'
#' @return rgbimage.minecraft
#' @export PrepareMinecraftMap
#'
#' @examples
#'
#' image = ImportPicture(system.file("pictures", "pngexample.png", package="PictureToMinecraft"))
#' image[,,1][1:5]
#' image.conv = ConvolutePixels(image, convolution.factor = 200)
#' image.prepped = PrepareMinecraftMap(image.conv)
#' image[1:5]
#'
#'
PrepareMinecraftMap <- function(image) {
  # For each pixel in image, return the associated minecraft block filename
  new.mat = matrix(nrow = nrow(image), ncol = ncol(image))
  for (row in 1:dim(image)[1]) {
    for (col in 1:dim(image)[2]) {
      pxl = image[row,col,1:3]
      block = PixelToBlock(pxl)
      new.mat[row,col] = block
    }
  }

  class(new.mat) = 'rgbimage'
  attr(new.mat, "minecraftplot.ready") = TRUE

  new.mat
}
