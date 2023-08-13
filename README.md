# PictureToDice
## Description
This is an R package that I spent a day designing that takes PNG images and converts them into Dice Maps.
![](inst/pictures/pngexample.png)
Using some very simple functions in this package, we can convert this image into a dice map:
```
file = system.file("pictures", "pngexample.png", package="PictureToDice")
image = ImportPicture(file)
image.conv = ConvolutePixels(image,20)
image.prepped = PrepareDiceMap(image.conv, exposure.increase = 1)
PlotDiceMap(image.prepped, 0.5)
```
![](Rplot.png)
