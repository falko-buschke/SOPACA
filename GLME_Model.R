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

########################################################################        
       
# Define two candidate models (Appendix 1)  
        
# Log-linked Gamma generalised linear mixed effect model          
mod.glm <- glmer(val~ pa * es.c + (1|country), family=Gamma(link = "log"))
# Model fails to converge with default settings, so define different optimizer
mod.glm <- glmer(val~  pa * es.c + (1|country), family=Gamma(link = "log"),control=glmerControl(optimizer="bobyqa",optCtrl=list(maxfun=2e5)))

# Linear mixed effects model with a log-transformed response variable
mod.log <- lmer(log(val)~ pa * es.c + (1|country))

# Model Diagnositic plots (Figure S1)

# Define plot device, name and margins
png(filename="Figure S1_converged.png",width=16,height=24,units="cm",res=300)

# Set number of panels and margins
par(mfrow=c(3,2))
par(mai=c(0.7,0.7,0.3,0.05))

# Q-Q Plot of residuals for Log-linked Gamma generalised linear mixed effect model 
qqnorm(resid(mod.glm), main="", ylim=c(-10,10), pch=16, col=rgb(0,0, 0.5,0.5),cex=1.2, las=1, cex.axis=1.1, cex.lab= 1.3, mgp=c(2.5,0.6,0))
qqline(resid(mod.glm))
mtext("a",cex=1.3, side = 3, adj = 0, line = 0.5,font=2)

# Q-Q Plot of residuals Linear mixed effects model with a log-transformed response variable
qqnorm(resid(mod.log), main="", ylim=c(-10,10), pch=16, col=rgb(0.5,0, 0,0.5),cex=1.2, las=1, cex.axis=1.1, cex.lab= 1.3, mgp=c(2.5,0.6,0))
qqline(resid(mod.log))
mtext("b",cex=1.3, side = 3, adj = 0, line = 0.5,font=2)

# Plot residuals against predicted values (with smoothing spline) for Log-linked Gamma generalised linear mixed effect model  
plot(exp(predict(mod.glm, re.form=~0)),residuals(mod.glm, type = 'deviance'),  xlab="Predicted values", ylab="Residuals",
     ylim=c(-10,10), pch=16, col=rgb(0,0, 0.5,0.3),cex=1.2, las=1, cex.axis=1.1, cex.lab= 1.3, mgp=c(2.5,0.6,0))
smoothingSpline <- smooth.spline(exp(predict(mod.glm, re.form=~0)),residuals(mod.glm, type = 'deviance'), spar=1.2)
lines(smoothingSpline, col="black", lwd=2); abline(h=0, lwd=2, lty=2)
mtext("c",cex=1.3, side = 3, adj = 0, line = 0.5,font=2)

# Plot residuals against predicted values (with smoothing spline) for Linear mixed effects model with a log-transformed response variable
plot(predict(mod.log, re.form=~0),residuals(mod.log, type = 'deviance'),  xlab="Predicted values", ylab="Residuals",
     ylim=c(-10,10), pch=16, col=rgb(0.5,0, 0,0.3),cex=1.2, las=1, cex.axis=1.1, cex.lab= 1.3, mgp=c(2.5,0.6,0))
smoothingSpline <- smooth.spline(predict(mod.log, re.form=~0),residuals(mod.log, type = 'deviance'), spar=.2)
lines(smoothingSpline, col="black", lwd=2); abline(h=0, lwd=2, lty=2)
mtext("d",cex=1.3, side = 3, adj = 0, line = 0.5,font=2)

# Quantile plot of random intercepts (Country ID) for Log-linked Gamma generalised linear mixed effect model 
r_int<- ranef(mod.glm)$country$`(Intercept)`
qqnorm(r_int, main="", ylim=c(-6,3), pch=16, col=rgb(0,0, 0.5,0.8),cex=1.2, las=1, cex.axis=1.1, cex.lab= 1.3, mgp=c(2.5,0.6,0), ylab="Random effect quantiles")
qqline(r_int)
mtext("e",cex=1.5, side = 3, adj = 0, line = 0.5,font=2)

# Quantile plot of random intercepts (Country ID) for Linear mixed effects model with a log-transformed response variable
r_int<- ranef(mod.log)$country$`(Intercept)`
qqnorm(r_int, main="", ylim=c(-6,3), pch=16, col=rgb(0.5,0, 0 ,0.8),cex=1.2, las=1, cex.axis=1.1, cex.lab= 1.3, mgp=c(2.5,0.6,0), ylab="Random effect quantiles")
qqline(r_int)
mtext("f",cex=1.3, side = 3, adj = 0, line = 0.5,font=2)

# Close plotting device and save to file
dev.off()

########################################################################

# Formulate subset models for each combination of predictors 

        # Full model with interaction term
        mod.full <- glmer(val~ pa * es.c + (1|country), family=Gamma(link = "log"),control=glmerControl(optimizer="bobyqa",optCtrl=list(maxfun=2e5)))
        
        # Full model only with additive terms
        mod.add <- glmer(val~ pa + es.c + (1|country), family=Gamma(link = "log"),control=glmerControl(optimizer="bobyqa",optCtrl=list(maxfun=2e5)))
        
        # Model with only protected status
        mod.pa <- glmer(val~ pa  + (1|country), family=Gamma(link = "log"))
        
        # Model with only ecosystem service type
        mod.es <- glmer(val~  es.c + (1|country), family=Gamma(link = "log"))


# Compare candidate models using likelihood-ratio Chi-squared test (Table 1)
anova(mod.full,mod.add,mod.es,mod.pa)


########################################################################

# Plot model predictions

# Generate a new data frame with each combiantion of country, protected status, and ecosystem service type
new.dat <- data.frame(expand.grid(unique(pa),unique(es),unique(country)))
names(new.dat) <- c("pa","es.c","country")

# Predict the outcome for each combination in the new data frame
new.pred <- predict(mod.full,new.dat, type="response")


# Define the colour palette
col.ramp <- brewer.pal(6,"Dark2")

# Define plot device, name and margins
#png(filename="Figure 2.png",width=26,height=20,units="cm",res=300)
pdf(file = "Figure 2_v2.pdf",   # The directory you want to save the file in
    height = 7.87402, # The width of the plot in inches
    width = 10.2362)

par(mai=c(0.8,3.2,0.05,0.05))

# Create a identity vector for each country
id <- rep(1:6,each=24)

# Plot a strip chart with empirical estimates
stripchart(val~pa+es,
           method = "jitter", 
           pch = 16, cex=0.6 , 
           col = rgb(0,0,0,0.4),  
           vertical = FALSE,   
           add = FALSE,
           at=1:24,yaxt='n',log="x",xlim=c(0.5e-2,1e6),
           las=1, ylab="", xlab=expression(paste("Standardised value (Int. $"~ ha^-1~year^-1~paste(")"))),
           ylim=c(1,24),  cex.axis=1, cex.lab= 1.2, mgp=c(2.5,0.6,0))

# Add horizontal lines to separate ecoystem service types
abline(h=seq(2.5,22.5,by=2), col="grey")

# Label the axis with ecosystem service types
es.lab <- names(table(new.dat$es) )                                                                                                                                     
axis(2, at=seq(1.5,23.5,by=2),es.lab,las=1, cex.lab=1.5)

# In a loop, predict the intercepts for each country, one-by-one
        for (j in 1:6){
                stripchart(new.pred[id==j]~new.dat$pa[id==j]+new.dat$es[id==j],
                   method = "stack", 
                   pch = c(0,15), cex=1.6 ,     
                   col = col.ramp[j],          
                   vertical = FALSE,   
                   add = TRUE)
        }


# Add a legens
legend ("right", pch=c(15,15,15,15,15,15,0,15), col=c(col.ramp[c(5,2,4,6,3,1)],"black","black"),cex=1.2,bg="white",
        c("Botswana","Ethiopia","Kenya","South Africa","Tanzania","Uganda", "Unprotected","Protected"))

# Close plotting device and save to file
dev.off()


########################################################################
# Display coefficient estimates (Table 2)
summary(mod.full)

#########################################################################


# Alternative model formulation that includes country and biome as random effects

# Model with country and biome
 mod.bio.c <- glmer(val~  pa * es.c + (1|country) + (1|biome), family=Gamma(link = "log"),
        control=glmerControl(optimizer="bobyqa",optCtrl=list(maxfun=2e7,xtol_abs=1e-8, ftol_abs=1e-8)))

# Model fails to converge, so try a different apprach.
# Duplicate the model outputs
fm1 <- mod.bio.c

# Change the tolerance limits
strict_tol <- glmerControl(optCtrl=list(xtol_abs=1e-8, ftol_abs=1e-8))

# Update the model with differnce tolerence limits
fm1.restart <- update(fm1, start=pars,control=strict_tol)

# Summarise the converged model (Table S1)
summary(fm1.restart)
