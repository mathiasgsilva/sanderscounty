model2 <- gam(fraction_votes~s(ele_demvotpart)+s(I(log(pop_density_10)))+s(pop_fem_14)+s(pop_whiteonly_14)+s(pop_over65_14)+s(pop_foreignborn_0913)+s(pop_vetprop_0913)+s(pop_overbachelors_0913)+s(eco_hownership_0913)+s(eco_poverty_0913)+s(eco_nfemp_13)+s(I(log(eco_firms_07+1)))+factor(state_abbreviation),data=data)

#Graphical output of GAM model 2
setEPS()
postscript("model2.eps")
par(mfrow=c(3,4))
plot(model2)
dev.off()

#Test of OLS vs GAM
anova(model1,model2)

