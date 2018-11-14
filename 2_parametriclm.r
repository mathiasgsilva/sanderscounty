model1 <- lm(fraction_votes~ele_demvotpart+I(log(pop_density_10))+pop_fem_14+pop_whiteonly_14+pop_over65_14+pop_foreignborn_0913+pop_vetprop_0913+pop_overbachelors_0913+eco_hownership_0913+eco_poverty_0913+eco_nfemp_13+I(log(eco_firms_07+1))+factor(state_abbreviation),data=data)

#Joint significance test of state dummies:
model1_nostate <- lm(fraction_votes~ele_demvotpart+I(log(pop_density_10))+pop_fem_14+pop_whiteonly_14+pop_over65_14+pop_foreignborn_0913+pop_vetprop_0913+pop_overbachelors_0913+eco_hownership_0913+eco_poverty_0913+eco_nfemp_13+I(log(eco_firms_07+1)),data=data)

anova(model1_nostate,model1)
