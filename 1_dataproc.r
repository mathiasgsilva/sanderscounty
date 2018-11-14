#Variable selection on county data
county_data <- read.csv("county_facts.csv")
county_data <- county_data[which(county_data$state_abbreviation!=""),c("fips","area_name","state_abbreviation","PST045214","AGE295214","AGE775214","SEX255214","RHI125214","POP645213","EDU685213","VET605213","HSG445213","PVY020213","BZA110213","SBO001207","POP060210")]
colnames(county_data) <- c("fips","area_name","state_abbreviation","pop_14","pop_under18_14","pop_over65_14","pop_fem_14","pop_whiteonly_14","pop_foreignborn_0913","pop_overbachelors_0913","pop_veterans_0913","eco_hownership_0913","eco_poverty_0913","eco_nfemptot_13","eco_firms_07","pop_density_10")

#Proportion of democratic votes per county and merging of election results to county data
election_data <- read.csv("primary_results.csv")
election_data <- election_data[which(election_data$fips%in%county_data$fips),]
election_data <- election_data[order(election_data$fips),]
election_data <- election_data[which(election_data$party=="Democrat"),]
ele_demvotes <- by(election_data,election_data$fips,FUN=function(x){sum(x$votes)})

data <- merge(county_data[order(county_data$fips),],election_data[which(election_data$candidate=="Bernie Sanders"),c("fips","fraction_votes")],by="fips")

#Creating democrat dummy per county, nonfarm employment rate estimate, and voting participation per county variable
data$ele_demvotes <- ele_demvotes
data$ele_demvotpart <- (data$ele_demvotes/(data$pop_14*(1-(data$pop_under18_14/100))))*100
data$eco_nfemp_13 <- (data$eco_nfemptot_13/data$pop_14)*100
data$pop_vetprop_0913 <- (data$pop_veterans_0913/data$pop_14)*100
data$fraction_votes <- data$fraction_votes*100

rm(list=c("county_data","election_data","ele_demvotes"))
