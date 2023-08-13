#' ImportPicture
#'
#' Imports a .png file from a file location and converts it to grey scale.
#' Uses the *png* library.
#'
#' @param file file path with respect to working directory.
#'
#' @import png
#' @return gsimage
#' @export ImportPicture
#'
#' @examples
#'
#' file = system.file("pictures", "pngexample.png", package="PictureToMinecraft")
#' image = ImportPicture(file)
#' class(image)
#' dim(image)
#'
#'
#'
ImportPicture <- function(file) {
  # Get the picture from file or wherever.
  image = png::readPNG(file)
  # Return RGB of image
  result = image[,,1:3]
  class(result) = 'rgbimage'
  return (result)
}
