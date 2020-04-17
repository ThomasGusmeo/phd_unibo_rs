#R code for RS

install.packages("raster")
library(raster)

> 
> setwd("/Users/thomasgusmeo/Desktop/Lab")
> 
> p224r63_2011 <- brick("p224r63_2011_masked.grd")
> plot(p224r63_2011)
> 
> #B1: Blue
> #B2: green
> #B3: red
> #B4: NIR
> 
> cl <- colorRampPalette(c('black','grey','light gray'))(100)
> plot(p224r63_2011, col=cl)
> 
> par(mfrow=c(2,2))
> clb <- colorRampPalette(c('dark blue','blue','light blue'))(100)
> plot(p224r63_2011$B1_sre, col=clb)
> 
> clg <- colorRampPalette(c('dark green','green','light green'))(100)
> plot(p224r63_2011$B2_sre, col=clg)
> clr <- colorRampPalette(c('dark red','red','pink'))(100)
> 
> 
> clr <- colorRampPalette(c('dark red','red','pink'))(100)
> plot(p224r63_2011$B3_sre, col=clr)

> 
> cln <- colorRampPalette(c('red','orange','yellow'))(100)
> plot(p224r63_2011$B4_sre, col=cln)

> 
> dev.off()
null device 
          1 
> #RGB
> 
> plotRGB(p224r63_2011,r=3,g=2,b=1,stretch="Lin")
> 
> plotRGB(p224r63_2011,r=4,g=3,b=2,stretch="Lin")
> 
> #Exercise: mount NIR on top of the Green component of the RGB
> 
> plotRGB(p224r63_2011,r=2,g=4,b=3,stretch="Lin")
> 
> plotRGB(p224r63_2011,r=3,g=4,b=2,stretch="Lin")
plotRGB(p224r63_2011,r=3,
> 
> 
> plotRGB(p224r63_2011,r=3,g=2,b=4,stretch="Lin")


plotRGB(p224r63_2011,r=3,g=2,b=4,stretch="Lin")
> 
> 
> 
> #1988 image
> 
> p224r63_1988 <- brick("p224r63_1988_masked.grd")
> 
> par(mfrow=c(2,1))
> plotRGB(p224r63_2011,r=4,g=3,b=2,stretch="Lin")
> plotRGB(p224r63_1988,r=4,g=3,b=2,stretch="Lin") plotRGB(p224r63_2011,r=4,g=3,b=2,stretch="Lin")
Error: unexpected symbol in "plotRGB(p224r63_1988,r=4,g=3,b=2,stretch="Lin") plotRGB"
> plotRGB(p224r63_1988,r=4,g=3,b=2,stretch="Lin")
plotRGB(p224r63_2011,r=4,g=3,b=2,stretch="Lin")
> plotRGB(p224r63_2011,r=4,g=3,b=2,stretch="Lin")

par(mfrow=c(2,1))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
> 
> par(mfrow=c(2,1))
> plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
> plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")

> 
> par(mfrow=c(2,1))
> plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="hist")
> plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="hist")
> 
> #DVI for the two year: compare with a difference in time
> #NIT-RED
> #NDVI=(NIR-RED)/(NIR+RED)
> 
> dvi1988 <- p224r63_1988$B4-sre - p224r63_1988$B3-sre
Error in .local(x, ...) : invalid layer names
> dvi1988 <- p224r63_1988$B4-sre - p224r63_1988$B3-sre
Error in .local(x, ...) : invalid layer names
> dvi1988 <- p224r63_1988$B4_sre - p224r63_1988$B3_sre
dvi1988 <- p224r63_1988$B4-sre - p224r63_1988$B3-sre
> dvi2011 <- p224r63_2011$B4_sre - p224r63_2011$B3_sre
> 
> par(mfrow=c(2,1))
> plot(dvi1988)
> plot(dvi2011)
> 
> cldvi <- colorRampPalette(c('red','orange','green'))(100)
> 
> cldvi <- colorRampPalette(c('red','orange','green'))(100)
> 
> plot(dvi1988, col=cldvi)
> plot(dvi2011, col=cldvi)
> 
> cldvi <- colorRampPalette(c('red','orange','yellow'))(100)
> 
> plot(dvi1988, col=cldvi)
> plot(dvi2011, col=cldvi)
> 
> #difference in time
> difdvi <- dvi2011 - div1988
Error: object 'div1988' not found
> difdvi <- dvi2011 - dvi1988
> 
> cldif <- colorRampPalette(c('blue','white','red'))(100)
> plot(difdvi, col=cldif)
> plot(difdvi, col=cldif)
> 
> library(RStoolbox)
> 
> #PCA
> p224r63_2011res <- aggregate(p224r63_2011, fact=10)
> 
> par(mfrow=c(2,1))
> plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
> plotRGB(p224r63_2011res, r=4, g=3, b=2, stretch="Lin")
> p224r63_2011
class      : RasterBrick 
dimensions : 1499, 2967, 4447533, 7  (nrow, ncol, ncell, nlayers)
resolution : 30, 30  (x, y)
extent     : 579765, 668775, -522705, -477735  (xmin, xmax, ymin, ymax)
crs        : +proj=utm +zone=22 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0 
source     : /Users/thomasgusmeo/Desktop/Lab/p224r63_2011_masked.grd 
names      :       B1_sre,       B2_sre,       B3_sre,       B4_sre,       B5_sre,        B6_bt,       B7_sre 
min values : 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.196277e-02, 4.116526e-03, 2.951000e+02, 0.000000e+00 
max values :    0.1249041,    0.2563655,    0.2591587,    0.5592193,    0.4894984,  305.2000000,    0.3692634 

> p224r63_2011res
class      : RasterBrick 
dimensions : 150, 297, 44550, 7  (nrow, ncol, ncell, nlayers)
resolution : 300, 300  (x, y)
extent     : 579765, 668865, -522735, -477735  (xmin, xmax, ymin, ymax)
crs        : +proj=utm +zone=22 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0 
source     : /private/var/folders/x3/vpjwtb095lsbvm_t2sv48s8r0000gn/T/RtmpmyNYKS/raster/r_tmp_2020-04-17_123745_18170_70185.grd 
names      :       B1_sre,       B2_sre,       B3_sre,       B4_sre,       B5_sre,        B6_bt,       B7_sre 
min values :   0.00670000,   0.01580000,   0.01356544,   0.01648527,   0.01500000, 295.54400513,   0.00270000 
max values :   0.04936299,   0.08943339,   0.10513023,   0.43805822,   0.31297142, 303.57499786,   0.18649654 

> p224r63_2011_pca <- rasterPCA(p224r63_2011res)
> 
> summary(p224r63_2011_pca$model)
Importance of components:
                          Comp.1      Comp.2       Comp.3       Comp.4       Comp.5       Comp.6
Standard deviation     1.2050671 0.046154880 0.0151509516 4.575220e-03 1.841357e-03 1.233374e-03
Proportion of Variance 0.9983595 0.001464535 0.0001578135 1.439091e-05 2.330990e-06 1.045814e-06
Cumulative Proportion  0.9983595 0.999824022 0.9999818357 9.999962e-01 9.999986e-01 9.999996e-01
                             Comp.7
Standard deviation     7.595367e-04
Proportion of Variance 3.966085e-07
Cumulative Proportion  1.000000e+00
> plotRGB(p224r63_2011_pca$map, r=4, g=3, b=2, stretch="Lin")
> 
> plot(p224r63_2011_pca$map)
> 
> 
> #land cover
> p224r63_2011c <- unsuperClass(p224r63_2011, nClasses=5)
> clclass <- colorRampPalette(c('red', 'green', 'yellow', 'blue', 'black'))(100) 
> 
> plot(p224r63_2011c$map, col=clclass)
> 
