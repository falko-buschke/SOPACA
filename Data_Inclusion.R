# Code to save the file in .png format
#png(filename="DataInclusion.png",width=18,height=16,units="cm",res=300)

# Code to save the file in .pdf format
pdf(file = "DecisionTree.pdf",   # The directory you want to save the file in
    height = 6.29927, # The width of the plot in inches
   width = 7.29921)

##############################################################################################
# Set plot margins
par(mai=c(0.1,0.2,0.5,.1))

##############################################################################################
# Base plot
plot(0,0,xlim=c(10,100),ylim=c(-10,220), type="n", axes=F,xlab="",ylab="")

# Add all the polygons to the plot
polygon(c(15,15,55,55), c(205,220,220,205), border=NA, col=rgb(0,0,0.2,1))
polygon(c(15,15,55,55), c(175,190,190,175))
polygon(c(60,60,100,100), c(150,165,165,150), border=NA, col=rgb(0.2,0.2,0.7,0.4))
polygon(c(15,15,55,55), c(145,160,160,145))
polygon(c(60,60,100,100), c(120,135,135,120), border=NA, col=rgb(0.2,0.2,0.7,0.4))
polygon(c(15,15,55,55), c(115,130,130,115))
polygon(c(60,60,100,100), c(90,105,105,90), border=NA, col=rgb(0.2,0.2,0.7,0.4))
polygon(c(15,15,55,55), c(85,100,100,85))
polygon(c(60,60,100,100), c(60,75,75,60), border=NA, col=rgb(0.2,0.2,0.7,0.4))
polygon(c(15,15,55,55), c(55,70,70,55))
polygon(c(60,60,100,100), c(30,45,45,30), border=NA, col=rgb(0.2,0.2,0.7,0.4))
polygon(c(15,15,55,55), c(25,40,40,25))
polygon(c(60,60,100,100), c(0,15,15,0), border=NA, col=rgb(0.2,0.2,0.7,0.4))
polygon(c(15,15,55,55), c(-5,10,10,-5), border=NA, col=rgb(0,0,0.2,1))

##############################################################################################
# Add all the arrows
arrows(35,205,35,190, len=0.1, lwd=1.5, angle=15)
arrows(35,175,35,160, len=0.1, lwd=1.5, angle=15)
arrows(35,145,35,130, len=0.1, lwd=1.5, angle=15)
arrows(35,115,35,100, len=0.1, lwd=1.5, angle=15)
arrows(35,85,35,70, len=0.1, lwd=1.5, angle=15)
arrows(35,55,35,40, len=0.1, lwd=1.5, angle=15)
arrows(35,25,35,10, len=0.1, lwd=1.5, angle=15)
arrows(55,175,65,165, len=0.1, lwd=1.5, angle=15)
arrows(55,145,65,135, len=0.1, lwd=1.5, angle=15)
arrows(55,115,65,105, len=0.1, lwd=1.5, angle=15)
arrows(55,85,65,75, len=0.1, lwd=1.5, angle=15)
arrows(55,55,65,45, len=0.1, lwd=1.5, angle=15)
arrows(55,25,65,15, len=0.1, lwd=1.5, angle=15)


##############################################################################################
# Add all the text to the plot
text(35,167.5,pos=2, font=2, "YES",cex=0.8)
text(35,137.5,pos=2, font=2, "YES",cex=0.8)
text(35,107.5,pos=2, font=2, "YES",cex=0.8)
text(35,77.5,pos=2, font=2, "YES",cex=0.8)
text(35,47.5,pos=2, font=2, "YES",cex=0.8)
text(35,17.5,pos=2, font=2, "YES",cex=0.8)
text(60,172.5,pos=4, font=2, "NO",cex=0.8)
text(60,142.5,pos=4, font=2, "NO",cex=0.8)
text(60,112.5,pos=4, font=2, "NO",cex=0.8)
text(60,82.5,pos=4, font=2, "NO",cex=0.8)
text(60,52.5,pos=4, font=2, "NO",cex=0.8)
text(60,22.5,pos=4, font=2, "NO",cex=0.8)

text(35,212.5, "9,453 records in ESVD databse", col="white", font=2)
text(35,182.5, "(n = 9,453) Are the records within the\nfocus countries?", cex=0.8)
text(35,152.5, "(n = 1,166) Are the records at local\nand sub-national scales?", cex=0.8)
text(35,122.5, "(n = 1,079) Do the records all include\neconomic estimates?", cex=0.8)
text(35,92.5, "(n = 769) Do the records only include\neconomic estimates from a single service?", cex=0.8)
text(35,62.5, "(n = 652) Are records from countries with\nprotected and unprotected estimates?", cex=0.8)
text(35,32.5, "(n = 592) Are records for services from\nprotected and unprotected estimates?", cex=0.8)
text(35,2.5, "561 records included in analysis", col="white", font=2)
text(80,157.5, "Exclude 8,287 records from \noutside geographical footprint", cex=0.8, font=3)
text(80,127.5, "Exclude 87 records from \nnational or regional scales", cex=0.8, font=3)
text(80,97.5, "Exclude 310 records without \neconomic estimates", cex=0.8, font=3)
text(80,67.5, "Exclude 117 records with \naggregated value estimates", cex=0.8, font=3)
text(80,37.5, "Exclude 60 country records without\nprotected and unprotected estimates", cex=0.8, font=3)
text(80,7.5, "Exclude 31 records for services without\nprotected and unprotected estimates", cex=0.8, font=3)

# Save the plot to file
dev.off()
