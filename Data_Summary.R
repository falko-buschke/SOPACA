# Read the data from the cleaned ESVD Database
ES <- read.csv("ES_clean.csv", na.strings = "NULL")

#Install and load the required R-packages
install.packages (c("lme4", "RColorBrewer"))
library(lme4)
library(RColorBrewer)

# Reassign the variables to vectors with simpler names
        # Standardised value of ecosystem services
        val <- ES$Int..Per.Hectare.Per.Year
        # Protected or not
        pa <- ES$Protection.Statu
        # Ecosystem services as a factor
        es <- as.factor(ES$ES_1)
        # Reassign "Food" as the baseline factor
        es.c <- relevel(es, ref = "Food")
        # Country name
        country <- ES$Country_1
        # Biome
        biome <- ES$ESVD2.0_Biome_1

# Reformat the data as a table
npa.tab <- table(biome[which(pa=="No protection")],es[which(pa=="No protection")]) 
pa.tab <- table(biome[which(pa=="Protection")],es[which(pa=="Protection")]) 

###############################################################################
# Create a plot for the balance of records
png(filename="DataBalance.png",width=36,height=10,units="cm",res=300)

# Set plot margins
par(mfrow=c(1,3))
par(mai=c(0.7,2.4,0.3,0.05))

# Create barplot for cross-tabulation of protected areas and countries
barplot(table(pa,country),beside=T, las=1, horiz=T,main="(a) Countries", xlab="Number of records", xlim=c(0,180),
        col=c(rgb(1,0.5,0,1),rgb(0.2,0.8,0.2,1)));box()
legend("topright", pch=22,pt.bg=c(rgb(0.2,0.8,0.2,1),rgb(1,0.5,0,1)), pt.cex=1.5,c("Protected", "Not protected"))

# Create barplot for cross-tabulation of protected areas and types of ecosystem services
barplot(table(pa,es),beside=T, las=1, horiz=T,main="(b) Ecosystem services", xlab="Number of records", xlim=c(0,220),
        col=c(rgb(1,0.5,0,1),rgb(0.2,0.8,0.2,1)));box()
legend("topright", pch=22,pt.bg=c(rgb(0.2,0.8,0.2,1),rgb(1,0.5,0,1)), pt.cex=1.5,c("Protected", "Not protected"))

# Create barplot for cross-tabulation of protected areas and biomes
barplot(table(pa,biome),beside=T, las=1, horiz=T,main="(c) Biomes", xlab="Number of records", xlim=c(0,180),
        col=c(rgb(1,0.5,0,1),rgb(0.2,0.8,0.2,1)));box()
legend("topright", pch=22,pt.bg=c(rgb(0.2,0.8,0.2,1),rgb(1,0.5,0,1)), pt.cex=1.5,c("Protected", "Not protected"))

# Close plot device and save file
dev.off()


###############################################################################
# Create matrices of cross-tables
png(filename="S1_balance_square.png",width=27,height=27,units="cm",res=300)

# Set plot margins
par(mfrow=c(2,2))
par(mai=c(2.8,2.8,0.05,0.05))

# Cross-table of countries and biomes
tab <- table(country,biome)
plot(0,0,type="n",xlab="",ylab="", ylim=c(1,dim(tab)[1]),xlim=c(1,dim(tab)[2]), axes=F)
axis(1,at=1:dim(tab)[2],colnames(tab), las=2,tick=F)
axis(2,at=1:dim(tab)[1],rownames(tab), las=1,tick=F)
points(rep(1:dim(tab)[2],each=dim(tab)[1]),rep(1:dim(tab)[1],dim(tab)[2]), cex=3,
        pch=22,lwd=0.75,bg=rgb(0.8,0,0,as.vector(tab/max(tab))^0.25))

# Cross-table of countries and types of ecosystem services
tab <- table(country,es)
plot(0,0,type="n",xlab="",ylab="", ylim=c(1,dim(tab)[1]),xlim=c(1,dim(tab)[2]), axes=F)
axis(1,at=1:dim(tab)[2],colnames(tab), las=2,tick=F)
axis(2,at=1:dim(tab)[1],rownames(tab), las=1,tick=F)
points(rep(1:dim(tab)[2],each=dim(tab)[1]),rep(1:dim(tab)[1],dim(tab)[2]), cex=3,
        pch=22,lwd=0.75,bg=rgb(0,0.8,0,as.vector(tab/max(tab))^0.25))

# Just a blank plot in the bottom left corner
plot(0,0,type="n",xlab="",ylab="", ylim=c(0,dim(tab)[1]),xlim=c(0,dim(tab)[2]), axes=F)

# Cross-table of biomes and ecosystems services
tab <- table(biome,es)
plot(0,0,type="n",xlab="",ylab="", ylim=c(1,dim(tab)[1]),xlim=c(1,dim(tab)[2]), axes=F)
axis(1,at=1:dim(tab)[2],colnames(tab), las=2,tick=F)
axis(2,at=1:dim(tab)[1],rownames(tab), las=1,tick=F)
points(rep(1:dim(tab)[2],each=dim(tab)[1]),rep(1:dim(tab)[1],dim(tab)[2]), cex=3,
        pch=22,lwd=0.75,bg=rgb(0,0,0.8,as.vector(tab/max(tab))^0.25))

# Close plot device and save file
dev.off()
