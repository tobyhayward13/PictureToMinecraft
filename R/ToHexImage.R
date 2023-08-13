#' ToHexImage
#'
#' Take a rgbimage and convert it to a rgbimage.hex image as a single nxn matrix
#'
#' @param image rgbimage
#'
#' @return character hexcode
#' @export rgbimage.hex
#'
#' @examples
#'
#' image = ImportPicture(system.file("pictures", "pngexample.png", package="PictureToMinecraft"))
#' image.conv = ConvolutePixels(image, convolution.factor = 100)
#' image.hex = ToHexImage(image.conv)
#' image.hex[,,1][1:5]
#'
ToHexImage <- function(image) {
  image.out = matrix(nrow = dim(image)[1], ncol = dim(image)[2])

  for (i in 1:dim(image)[1]){
    for (j in 1:dim(image)[2]) {
      x = image[i,j,1:3]
      x.hex = ToHex(x)
      image.out[i,j] = x.hex
    }
  }

  class(image.out) = 'rgbimage.hex'
  image.out
}
