% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ToHexImage.R
\name{ToHexImage}
\alias{ToHexImage}
\title{ToHexImage}
\usage{
ToHexImage(image)
}
\arguments{
\item{image}{rgbimage}
}
\value{
character hexcode
}
\description{
Take a rgbimage and convert it to a rgbimage.hex image as a single nxn matrix
}
\examples{

image = ImportPicture(system.file("pictures", "pngexample.png", package="PictureToMinecraft"))
image.conv = ConvolutePixels(image, convolution.factor = 100)
image.hex = ToHexImage(image.conv)
image.hex[,,1][1:5]

}
