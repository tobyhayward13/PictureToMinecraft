#' ConvolutePixels
#'
#' Takes a bitmap image in the form of a matrix and convolutes the pixels to form
#' an image of a smaller size.
#'
#' @param image rgbimage matrix object.
#' @param convolution.factor n x n area of pixels to reduce.
#'
#' @return rgbimage
#' @export ConvolutePixels
#'
#' @examples
#'
#' image = ImportPicture(system.file("pictures", "pngexample.png", package="PictureToMinecraft"))
#' dim(image)
#' image.conv = ConvolutePixels(image, convolution.factor = 20)
#' dim(image.conv)
#'
ConvolutePixels <- function(image, convolution.factor = 2) {
  # Convolute the pixels in the image to a smaller and less resolution image.
  # convolution.factor = reduce pixels in image to convolution.factor^2 space to
  # one.
  # Step 1: If a dimension of the image is not a multiple of convolution.factor;
  # remove number of layers from outside the image to fit.
  if (dim(image)[1] %% convolution.factor != 0) {
    image = image[-(nrow(image):(nrow(image) - nrow(image) %% convolution.factor + 1)),,]
  }
  if (dim(image)[2] %% convolution.factor != 0) {
    image = image[,-(ncol(image):(ncol(image) - ncol(image) %% convolution.factor + 1)),]
  }

  # Step 2: Loop through the matrix and average pixels in a convolution.factor^2
  # area.
  new.mat = array(dim= c(nrow(image) / convolution.factor, ncol = ncol(image) / convolution.factor, 3))
  for (rgb in 1:3){
    for (r in seq(1,nrow(image), convolution.factor)) {
      for (c in seq(1,ncol(image), convolution.factor)) {
        pxl = image[r:(r+convolution.factor-1),c:(c+convolution.factor-1),rgb]
        new.mat[r %/% convolution.factor + 1, c %/% convolution.factor + 1, rgb] = mean(pxl)
      }
    }
  }
  class(new.mat) = 'rgbimage'
  return (new.mat)
}
